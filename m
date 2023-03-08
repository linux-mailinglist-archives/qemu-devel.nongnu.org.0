Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 652AE6B0075
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 09:06:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZon7-0003xv-Hl; Wed, 08 Mar 2023 03:04:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pZomV-0003fx-OA
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 03:04:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pZomS-0006RA-5Q
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 03:04:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678262651;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/UKHuk7l2sWMvtwVl3DLA45ZeIoeDs/Qm9epxemkMnY=;
 b=fm8mRE5ZxjmLwjQRLgkYgykYiSbGAbC4d+iil5iQ10IRnsg/a5ocEZRN+mPfN0N59m67fA
 oyxOfi7ScUVF2kNxPJx/JH9A/h71+qPzPc/McKxkHXgdd49cfKaJEFhyrGeF8mnJQdnbXj
 4qygSzrBo8frlur6z3zTUPI3A39qu7Q=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-593-RBX1GQJfMlOhc--xlaDfWQ-1; Wed, 08 Mar 2023 03:04:09 -0500
X-MC-Unique: RBX1GQJfMlOhc--xlaDfWQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 r7-20020a05600c35c700b003eb3f2c4fb4so500181wmq.6
 for <qemu-devel@nongnu.org>; Wed, 08 Mar 2023 00:04:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678262648;
 h=content-transfer-encoding:in-reply-to:references:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/UKHuk7l2sWMvtwVl3DLA45ZeIoeDs/Qm9epxemkMnY=;
 b=ohFaJ3QWBrOnYZDew+zuS2nuomn9uZ376rhXiThpVHlIpi5m7VzOqgYpkaHH3Oy8Nc
 VxLU13n3/HNvbKlj9/EgaJsqZ9SaG9FdteJarHClmBXw53uhqyQRJq/X9W9VucPEeLcr
 s3zXkxW3kfl1+Xvoq4FSCfob2VTl4y5cPiyYjzCLyI8vViKVIG+yoVPEkc8unPmgY/ef
 4xWVy+COgIHHjNYKJPG/2i1lly/jmuVvV+KaWPJn0fGJ/4Um/xAKOhXvmkBMCEPhwESl
 f3IPkfj+cWndWPRi3XgywzzBBa0iDvAUwmF4+YNDBcJc6nnd15JJJG4eRF8anc6sMX+0
 BWAg==
X-Gm-Message-State: AO0yUKXs/U8TYO3haaiSvx0YXphF/UAfUAP6VnJ0z3EQtftH8/AEp6yF
 RUVWaAKTzqBybvnN3WlKsm5SAagfA0t7gDLmZI4fKhemaD0vXGblE4aYwPw+1m+OpZ8UE8HVoLI
 QI1By+EoMMvFIk9vXvKgjfuVvx3jcRqY6Ig8TlmoJnrd63LmEpYz2xWAehNesjxMt3wwDhATehQ
 ==
X-Received: by 2002:a05:600c:a49:b0:3eb:3692:644e with SMTP id
 c9-20020a05600c0a4900b003eb3692644emr14999156wmq.33.1678262648405; 
 Wed, 08 Mar 2023 00:04:08 -0800 (PST)
X-Google-Smtp-Source: AK7set9qaYxnu6bibIZAh+58rbo27QTsbginv7PCi4/dFSE8hWkkzfpyukUO1ZPQIr0tYRUdhXTxxA==
X-Received: by 2002:a05:600c:a49:b0:3eb:3692:644e with SMTP id
 c9-20020a05600c0a4900b003eb3692644emr14999125wmq.33.1678262648038; 
 Wed, 08 Mar 2023 00:04:08 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-179-166.web.vodafone.de.
 [109.43.179.166]) by smtp.gmail.com with ESMTPSA id
 m14-20020adffe4e000000b002c54c8e70b1sm14774401wrs.9.2023.03.08.00.04.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Mar 2023 00:04:07 -0800 (PST)
Message-ID: <008c8615-47f1-2d6d-12f7-01822a90797a@redhat.com>
Date: Wed, 8 Mar 2023 09:04:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PULL v2 00/13] Final tests, s390x and misc updates before the
 soft freeze
Content-Language: en-US
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20230307134631.571908-1-thuth@redhat.com>
In-Reply-To: <20230307134631.571908-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 07/03/2023 14.46, Thomas Huth wrote:
>   Hi Peter!
> 
> The following changes since commit c29a2f40cd5d1fdad4632b48343cd968db041a44:
> 
>    Merge tag 'pull-target-arm-20230306' of https://git.linaro.org/people/pmaydell/qemu-arm into staging (2023-03-07 09:58:43 +0000)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/thuth/qemu.git tags/pull-request-2023-03-07
> 
> for you to fetch changes up to 7687cd2b99454bd289c8854eec2653cb855cad67:
> 
>    pc-bios/s390-ccw: Update s390-ccw.img with the list-directed IPL fix (2023-03-07 14:30:43 +0100)

FYI: I just repushed the tag to fix a typo in the arm 32-bit host 
deprecation patch ("continuous" -> "continues", thanks to everybody who 
spotted it, and sorry for missing to fix it earlier).

New commit id is now e3b27e7985d57ce22fe0e308a27615acb07a1724 .

I hope that's still ok, please let me know if I should send a v3 instead.

  Thomas


