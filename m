Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FFAF2F187D
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 15:42:51 +0100 (CET)
Received: from localhost ([::1]:43412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyyPC-0004ep-AJ
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 09:42:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kyyNE-00041N-4A
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 09:40:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kyyN8-00070C-Gx
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 09:40:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610376038;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jWhGbkroVANXIUD1K77vMVeXoL3o/YmS7M19/i6588I=;
 b=KKttpgCnhlzx37/QMC0l7Q3ydQCgHm+ZjiXjKLh0tiDyAZUDRFEtMmGxESLcDa6GUvbOG5
 8dyEDpYzeL7Rrx7kuTwGtvLM8h03c6OEDM45fjVYjp/3cSh+9CeU2BYNJLv51MPkQx/cQu
 jE3AyuBLdt3JyYSx/Phn1qUqQVyNRto=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-583-SMRe5i8YPhqM7mdgSHZoTg-1; Mon, 11 Jan 2021 09:40:36 -0500
X-MC-Unique: SMRe5i8YPhqM7mdgSHZoTg-1
Received: by mail-ed1-f70.google.com with SMTP id g25so8323307edu.4
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 06:40:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jWhGbkroVANXIUD1K77vMVeXoL3o/YmS7M19/i6588I=;
 b=pMGvdh8lREJnYVAl/nwf5GPJOpqSK2/0JStaTF7wwVL4z0z5tNE6Q8a4n9/uCA161S
 2vDUCLm13L/Y9AjL3E5eSSfLAMzQhNQqYOA9a/rvc9wGhM5ZZlFb2wP+L3lOcjhLDYkH
 z3maqCcLAG0oZQVjQeUw5lxgzj+Ao9R+U6kJN8MUx5/haOKIzDnIKUbzAHsonXzA+TLz
 3WIEYmKk+Opy55eMstQzQxgAhusQ2Mtb2q/wBc+svdsDbDGd9JwQYf7655ZDDX4NHT7o
 PEXIirYYeonGDB736zvswgKrca5n2fgRsFvgT5NFkQT7AK3GFZ+0KETPMdHiUJ1bLDbY
 P8Ww==
X-Gm-Message-State: AOAM530Vewga3aGxpT1kuqf6OqisGAI+k9zbJc0V6rgpIS6teqCk2z2i
 RDnDcJNK2K2o7qc0uf4K3RJTYjf8i2DwL0R/RaNRTZsRxX6HcMsbZP2Qqy6gHSNFvwpIVOaxP4j
 bcTZ4g3KbIKGNltI=
X-Received: by 2002:a17:906:2681:: with SMTP id
 t1mr10948922ejc.29.1610376035170; 
 Mon, 11 Jan 2021 06:40:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy/OVt+5/3A7+HhPRc2Y9fU5/sSux0BBl0wkqIbcwAYKX/xefnZcifr/fF+NPFMEZROaiKPWg==
X-Received: by 2002:a17:906:2681:: with SMTP id
 t1mr10948915ejc.29.1610376035003; 
 Mon, 11 Jan 2021 06:40:35 -0800 (PST)
Received: from [192.168.1.36] (129.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.129])
 by smtp.gmail.com with ESMTPSA id r7sm7151670ejo.20.2021.01.11.06.40.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jan 2021 06:40:34 -0800 (PST)
Subject: Re: [PULL v2 00/15] Testing, CI and bsd-user patches
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210111140602.159377-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <c3ff4be3-0962-8566-10aa-b2adb4304937@redhat.com>
Date: Mon, 11 Jan 2021 15:40:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210111140602.159377-1-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: acho@suse.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/11/21 3:06 PM, Thomas Huth wrote:
> The following changes since commit 7b09f127738ae3d0e71716cea086fc8f847a5686:
> 
>   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20210108' into staging (2021-01-08 15:37:04 +0000)
> 
> are available in the Git repository at:
> 
>   https://gitlab.com/huth/qemu.git tags/pull-request-2021-01-11v2
> 
> for you to fetch changes up to b677001d70529df271a5d9314440bb201da40acf:
> 
>   fuzz: map all BARs and enable PCI devices (2021-01-11 14:59:21 +0100)
> 
> ----------------------------------------------------------------
> * Fuzzer improvements
> * Add OpenSUSE leap to the gitlab-CI
> * Some fixes to get our CI "green" again
> * Some initial patches to update bsd-user
> ----------------------------------------------------------------

Doh, missed the Shippable-CI job reduction :/
https://www.mail-archive.com/qemu-devel@nongnu.org/msg771079.html


