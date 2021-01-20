Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C722FD68D
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 18:11:05 +0100 (CET)
Received: from localhost ([::1]:36916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2H0a-0006zF-Bs
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 12:11:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2GqS-0006eI-4f
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 12:00:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2GqQ-0001ti-9r
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 12:00:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611162032;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8jqKb1u+KcfF3tf9nFDsZH7/HAOTHS0JuWOAZu/XMz0=;
 b=Te6x2AL36LNB9hTtYK4YsxOM3FE7FNoEvdbwq8NAc51Y6k2sM++I6u3syNXrueaYl/BT2D
 8vApuq0EHtaDrJEG8rmza5RwpxNd6kuUbKCcBBRHgtbfCYCdD7ig0non/WgDs/x+3ksG/0
 rbUmGro5Mh4da7UxIqTUBv7Jf82S20w=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-13-ZVY9BT5RMYuENXdt_eKSYg-1; Wed, 20 Jan 2021 12:00:31 -0500
X-MC-Unique: ZVY9BT5RMYuENXdt_eKSYg-1
Received: by mail-ed1-f71.google.com with SMTP id ck25so7470450edb.16
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 09:00:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8jqKb1u+KcfF3tf9nFDsZH7/HAOTHS0JuWOAZu/XMz0=;
 b=BPunxK3INp+YpGUkqKpbmaUW2gZ+Ujl7fYrPGvKnxI9tRUZ+7a+L6nAPvp+umVAkH3
 UItV5q2pqimHwawc/wE6CmBb9URjy7pmUmF73RVVjo6vcX/95Nd0IRmyZYObJZlhKckk
 K+tzFtik+WIlLtRYzIoIi2QRqauQi12v6SQsFtodwFzl2B633NEnQOkVE7I5pXx+t6NC
 A2o949etFVGqTMPkFRPVsvSrIlzKU/gJRSC6rBOKt7nkusr3T++5ImEN3ubaiyj7O9WK
 rFiSrPmhKk4om+MMsY0s0FDLOULrXQW8NSMhSpfUvhMYOrmFhfg3AwTLnd02c2XUEByK
 fWow==
X-Gm-Message-State: AOAM532VRwbC9vVlev4WGbJ1cyF1kBnlDCHYPDih6FIFW7IPR/oZrmyj
 Wrp+F3aXvBqaH8W8MwlnhmGK5pjXoBgkX+JpR4UY0suXO1Qua8YE7ILHoCZunrTAtK0Hy6CFuNZ
 YmKe8eSgrQztnxpFGl2dZdDJsFJmhDyr/Me49JgDWwW3hyCjm7fPRqoAf4/g7BeU3
X-Received: by 2002:a50:fc18:: with SMTP id i24mr8455811edr.308.1611162029798; 
 Wed, 20 Jan 2021 09:00:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJziyjQDNSqDXcW0DAvS9dw3Wcx8vVJ5ijddz80lXebIiL7uURUZkHUgodCfrOojCyoNgmJNmw==
X-Received: by 2002:a50:fc18:: with SMTP id i24mr8455798edr.308.1611162029666; 
 Wed, 20 Jan 2021 09:00:29 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id re19sm1090290ejb.111.2021.01.20.09.00.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Jan 2021 09:00:29 -0800 (PST)
Subject: Re: [PATCH 3/3] configure: Emit warning when accelerator requested
 but not needed
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20210120151916.1167448-1-philmd@redhat.com>
 <20210120151916.1167448-4-philmd@redhat.com>
 <bdaa5334-873c-b225-ef6c-1664c4d6218f@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <56b79ecd-14f3-1931-1ea1-a3dcbd20c49d@redhat.com>
Date: Wed, 20 Jan 2021 18:00:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <bdaa5334-873c-b225-ef6c-1664c4d6218f@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.094, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/20/21 5:33 PM, Thomas Huth wrote:
> On 20/01/2021 16.19, Philippe Mathieu-Daudé wrote:
>> In some configurations it might be pointless to check and
>> compile accelerator code. Do not deselect the accelerator,
>> but emit a warning.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>   configure | 21 +++++++++++++++++++++
>>   1 file changed, 21 insertions(+)
>>
>> diff --git a/configure b/configure
>> index a5159157a49..09e1cd8bfe6 100755
>> --- a/configure
>> +++ b/configure
>> @@ -5514,6 +5514,27 @@ if test $git_update = 'yes' ; then
>>       (cd "${source_path}" && GIT="$git" "./scripts/git-submodule.sh"
>> update "$git_submodules")
>>   fi
>>   +if [ "$softmmu" = "no" ]; then
>> +    if [ "$tcg" = "enabled" ]; then
>> +        echo "WARN: TCG accelerator selected but no target requires it"
>> +    fi
> 
> What about linux-user? It needs TCG, but it can also be compiled with
> softmmu disabled, can't it?

Indeed, thanks for reviewing.


