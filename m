Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF651341A22
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 11:34:37 +0100 (CET)
Received: from localhost ([::1]:35802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNCSi-0004cE-R6
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 06:34:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lNCFH-0000m8-Bd
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 06:20:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lNCFF-0004BV-Oo
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 06:20:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616149241;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6XZsqKC2A1isL0XieiFn6aQ5W5Ly1ACo/T3Nfs4k1+A=;
 b=YcP4hNmpVxrcn3aeksZN8xgGwSdo/MFXRp1tzv/DldKvlrIIykfKrMHW6arUxI0OoR00La
 V0hQ6CWel49QQOgINVia+Mo0Yhu/XL1Wv6PNHMrFpRxhPUeMBeV8wRCln9tkLgJnhpy9c3
 1y4AHruxDtDOhvrLFEFJiwtWcEIUBuQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-501-rmkLLEQcOA2QJo9d0txxIA-1; Fri, 19 Mar 2021 06:20:37 -0400
X-MC-Unique: rmkLLEQcOA2QJo9d0txxIA-1
Received: by mail-wr1-f69.google.com with SMTP id m9so21637692wrx.6
 for <qemu-devel@nongnu.org>; Fri, 19 Mar 2021 03:20:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6XZsqKC2A1isL0XieiFn6aQ5W5Ly1ACo/T3Nfs4k1+A=;
 b=D7LNQKRgP0jqrNDn7qNDVP1vGh/HoWW+xMWhf5/AdCs5wQaxU7aUwpbIgU0cUqfsT/
 iRjpa0T9Y85m/7KH6zeontw255Eks5i1hW1Z+Je6ZDaQMZKwrA68YHnlSopt76/Hf++r
 O9r4SOGYT5UmkvJRBS1FKx0scn7uGkgwvbUgs1uwcFswwVkWne8fELc6n7cAvef7Dd20
 UVlaJf7NElGc7ExjDewdGKPLEZH2eiXz/58GAN0nsvUcKzxESP7/FLRE1Zn6x+Zb+j8s
 VBnBuJonPNzv0YMELmNECwgwMtKz0oCnco2t/bEPB2soBOU3GIFBKPmd7vuDq8wdDJxr
 p88Q==
X-Gm-Message-State: AOAM532BCuN9a7UMTkk6gYBab8LS+vpl9AO+fxv/4PzoO2kpvINkE81L
 tD0ZF7+lN6blrQvny0fVF2SrhSwRXi1kS9PiSrItEehGVvfACZNSviBQTV3WaFz9XUJgQbttCFj
 S6LURRO95e5jYje4=
X-Received: by 2002:adf:84e6:: with SMTP id 93mr3553961wrg.376.1616149236327; 
 Fri, 19 Mar 2021 03:20:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJymMyFv1nLPKKgJsyI2a41RhjqALiyWL4YtRprK548FB+S+ZSOQav0bvrK+0AUQPoPLVrPB3g==
X-Received: by 2002:adf:84e6:: with SMTP id 93mr3553935wrg.376.1616149236172; 
 Fri, 19 Mar 2021 03:20:36 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id 91sm7743231wrl.20.2021.03.19.03.20.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Mar 2021 03:20:35 -0700 (PDT)
Subject: Re: [PATCH v2] MAINTAINERS: Fix tests/migration maintainers
To: huangy81@chinatelecom.cn, qemu-devel <qemu-devel@nongnu.org>
References: <91d5978357fb8709ef61d2030984f7142847037d.1616141556.git.huangy81@chinatelecom.cn>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <842e7cbd-a444-04ac-35d5-168c6415441e@redhat.com>
Date: Fri, 19 Mar 2021 11:20:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <91d5978357fb8709ef61d2030984f7142847037d.1616141556.git.huangy81@chinatelecom.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/19/21 9:07 AM, huangy81@chinatelecom.cn wrote:
> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> 
> when executing the following scripts, it throw error message:
> $ ./scripts/get_maintainer.pl -f tests/migration/guestperf.py
> get_maintainer.pl: No maintainers found, printing recent contributors.
> get_maintainer.pl: Do not blindly cc: them on patches!  Use common sense.
> 
> add the tests/migration to the "Migration" section of MAINTAINERS
> 
> Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


