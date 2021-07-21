Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 350983D0A3A
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 10:07:19 +0200 (CEST)
Received: from localhost ([::1]:52564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m67GA-00049c-9T
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 04:07:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m67FJ-0003Im-Ts
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 04:06:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34130)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m67FH-00008f-C3
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 04:06:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626854781;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fR79pYBs09TDSUqWLZdNOZX/uNU1xkYo6xgAyfcnTl0=;
 b=XWD03aV9KanD6e1ERcApBVVmr1TYkwyPCF7B7dpg7t6BVSEwewbZV45Pdtn/l0gbYmFcXX
 TROza9vAGzXpWs9yJ3VU+BMfo3EwZnV1MQ6+dOhYnHHndMZaO0AJSjisNa+CBVXYJ9sF1J
 X9LT/LkbfPFsqLSOkIoacUSZsBHt+II=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-83-A1SrpjrRNSSA1ESymaiwbQ-1; Wed, 21 Jul 2021 04:06:19 -0400
X-MC-Unique: A1SrpjrRNSSA1ESymaiwbQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 x6-20020a7bc2060000b0290218ad9a8d4aso839044wmi.1
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 01:06:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fR79pYBs09TDSUqWLZdNOZX/uNU1xkYo6xgAyfcnTl0=;
 b=gOAul680luqoKI6KwpslL6dQiurffy/QKzlawVw5hrxZ8P36+3wQojqxhglQV3PAaB
 XmQ3HqowvV/7W4lYMaPijwdAdpGCms9lS6i7DLS+HDsco1qYCwrGCP5ERrX0YOc9soIM
 TL5XTydz2mibKhIgrfB4HziEvOBtOqDSK8t3EndKwqiRqeNFkWxdQ2EcEztwisZCL6w/
 2kj8MlNU3dj6IsxrU3rHyklk47TIW1gzrpQgu5WxwLcKhEZqbV3JzkDndjSL8wISRqwm
 A2FansNSRFf3RlmuXz6C8X02suZJ7Cykt8UGYm7yoqZ05uMPNOHLOxSXf34Y1W7zDrRh
 WU4g==
X-Gm-Message-State: AOAM533orM2QhD/P4lZAan44S1tLo4gka7V45rdA44M3vJpgbSiLjSxb
 C+EQlCJSdZyUrYRdWi/TqceZ5Y9EJ+er1BarfIEitzIH3to2gJCGIt+TtK1FD5byhaiP/tymf2u
 UXP/BNR+CipZg5gk=
X-Received: by 2002:a5d:4983:: with SMTP id r3mr40374937wrq.383.1626854778853; 
 Wed, 21 Jul 2021 01:06:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyxGCNrbzrgJx1myxLu364SCm9ZKJbO6mH1eo6nmaQ0BSiH8Qo7RO8lxtoj/bRl01ISQAd22Q==
X-Received: by 2002:a5d:4983:: with SMTP id r3mr40374920wrq.383.1626854778690; 
 Wed, 21 Jul 2021 01:06:18 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id z17sm12696282wrr.35.2021.07.21.01.06.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jul 2021 01:06:18 -0700 (PDT)
Subject: Re: [PATCH v1 09/29] gitdm.config: sort the corporate GroupMap entries
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210720232703.10650-1-alex.bennee@linaro.org>
 <20210720232703.10650-10-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <f82c67cb-7208-88c2-0501-d1a223a48b4c@redhat.com>
Date: Wed, 21 Jul 2021 10:06:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210720232703.10650-10-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, berrange@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/21/21 1:26 AM, Alex Bennée wrote:
> Lets try and keep them that way.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20210714182056.25888-10-alex.bennee@linaro.org>
> ---
>  gitdm.config | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


