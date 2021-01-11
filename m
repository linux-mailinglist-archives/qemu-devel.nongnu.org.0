Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC662F0D62
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 08:45:52 +0100 (CET)
Received: from localhost ([::1]:41026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyrtf-0000HT-Px
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 02:45:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kyrsB-000825-8e
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 02:44:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kyrs7-0001Pr-Vq
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 02:44:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610351053;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rdO4rHVjI80mzZ11drPaydwdqjCngZGhvMJuNqaxth4=;
 b=NzmT3mSWSOEtz4BtCwUE9mrQdUnCokDnM0f3LvPYFvc7VPAfTMOm4hgCplOvABuD5MKWPP
 gX8vJQoTzcjXtbOPQ3ADpqjUSSLAvN4aP8wUQf9uiFBEvONOd9G8XI1T02RIW1U9V1frgl
 iRPZszqHA7nfnTlvaxL35vhIkzo2W5E=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-389-z3kW6QcRO9yAJKIIWP9vNg-1; Mon, 11 Jan 2021 02:44:11 -0500
X-MC-Unique: z3kW6QcRO9yAJKIIWP9vNg-1
Received: by mail-ed1-f71.google.com with SMTP id dh21so7899630edb.6
 for <qemu-devel@nongnu.org>; Sun, 10 Jan 2021 23:44:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rdO4rHVjI80mzZ11drPaydwdqjCngZGhvMJuNqaxth4=;
 b=i6LNL3UHDNHv6rFSSvOCJFY8Iivwu/0dz7Xs+VQeGXd6cVJPvCwlgHRDUyRyB4MzKp
 hFjtgtpDCJC17+ZguqD4eVTTKz5oqQj4/SftL0RIaJmvC+AXU45WJ9UpDleXcgtdIDOO
 kcruhKfZwycvL1v4PEG0Dw+uRa91SrjY5hexj6SoQDf2QsLlMvPpVEE6Cv7LtXPup/qf
 VB0DtxIxwSPwP5Nu6co8ItS5K+TPlUf5q9dFMvFsQTHj/nivS+ZOW7nebLf1+sMsPfxT
 1p0YZ5sHf01qZsg0C7s4J40ByDQ9d/u8aoiYLgD4uFIVOkjttremejyjtkjEIsou4hdd
 BCvw==
X-Gm-Message-State: AOAM5316h/1uhtCX/lzTPq1pC842eYArt5vwOxEi0kDtbhBE+HAQo85y
 40Vp+GDt3DnlijaQQLvGaO9xNNqcIE7O4GP0lv/f9Pa7emyrJscYasKjlx+6NpInW+erzdfQZgD
 Ly+KaSStI+iX2JZQ=
X-Received: by 2002:a17:906:cc9c:: with SMTP id
 oq28mr10084102ejb.224.1610351050352; 
 Sun, 10 Jan 2021 23:44:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzn0gFgpStoi7bJCfDI03BveJSGWgrUXMbYI3Og4MTYqgMMSmpLrif/wNsdowsFzVw15rMwYQ==
X-Received: by 2002:a17:906:cc9c:: with SMTP id
 oq28mr10084091ejb.224.1610351050158; 
 Sun, 10 Jan 2021 23:44:10 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id dc22sm2658829ejb.67.2021.01.10.23.44.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Jan 2021 23:44:09 -0800 (PST)
Subject: Re: [PATCH] configure: Add flags for MinGW32 standalone build
To: Stefan Weil <sw@weilnetz.de>, Thomas Huth <thuth@redhat.com>,
 Joshua Watt <jpewhacker@gmail.com>, qemu-devel@nongnu.org
References: <20210107213856.34170-1-JPEWhacker@gmail.com>
 <8ea87ea1-093d-81b0-13d6-60caa9fcdad4@redhat.com>
 <0e956e41-4862-f979-3247-40d03c5054e4@gmail.com>
 <e2885e2e-cf8a-51f7-6dd8-a28ac4871eef@redhat.com>
 <a0cbc0c3-7c5b-ed81-8cfa-2129dda6a268@weilnetz.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <b7585238-25c7-d25f-dae1-d682dc084284@redhat.com>
Date: Mon, 11 Jan 2021 08:44:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <a0cbc0c3-7c5b-ed81-8cfa-2129dda6a268@weilnetz.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.012, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Yonggang Luo <luoyonggang@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/01/21 08:29, Stefan Weil wrote:
> Am 11.01.21 um 08:04 schrieb Thomas Huth:
> 
>> On 08/01/2021 19.30, Joshua Watt wrote:
>>>
>>> On 1/8/21 1:25 AM, Thomas Huth wrote:
>>>> On 07/01/2021 22.38, Joshua Watt wrote:
>>>>> There are two cases that need to be accounted for when compiling QEMU
>>>>> for MinGW32:
>>>>>   1) A standalone distribution, where QEMU is self contained and
>>>>>      extracted by the user, such as a user would download from the 
>>>>> QEMU
>>>>>      website. In this case, all of the QEMU files should be rooted in
>>>>>      $prefix to ensure they can be easily packaged together for
>>>>>      distribution
>>>>>   2) QEMU integrated into a distribution image/sysroot/SDK and
>>>>>      distributed with other programs. In this case, the provided
>>>>>      arguments for bindir/datadir/etc. should be respected as they 
>>>>> for a
>>>>>      Linux build.
>>>>>
>>>>> Add a configure time flags --enable-standalone-mingw and
>>>>> --disable-standalone-mingw that allows the user to control this
>>>>> behavior. The flag defaults to "enabled" if unspecified to retain the
>>>>> existing build behavior
>>>>>
>>>>> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
>>>>> ---
>>>>>   configure | 8 +++++++-
>>>>>   1 file changed, 7 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/configure b/configure
>>>>> index 5860bdb77b..5c83edb502 100755
>>>>> --- a/configure
>>>>> +++ b/configure
>>>>> @@ -358,6 +358,7 @@ strip_opt="yes"
>>>>>   tcg_interpreter="no"
>>>>>   bigendian="no"
>>>>>   mingw32="no"
>>>>> +mingw32_standalone="yes"
>>>>>   gcov="no"
>>>>>   EXESUF="$default_feature"
>>>>>   HOST_DSOSUF=".so"
>>>>> @@ -1558,6 +1559,10 @@ for opt do
>>>>>     ;;
>>>>>     --disable-fuse-lseek) fuse_lseek="disabled"
>>>>>     ;;
>>>>> +  --enable-standalone-mingw) mingw32_standalone="yes"
>>>>> +  ;;
>>>>> +  --disable-standalone-mingw) mingw32_standalone="no"
>>>>> +  ;;
>>>>>     *)
>>>>>         echo "ERROR: unknown option $opt"
>>>>>         echo "Try '$0 --help' for more information"
>>>>> @@ -1570,7 +1575,7 @@ libdir="${libdir:-$prefix/lib}"
>>>>>   libexecdir="${libexecdir:-$prefix/libexec}"
>>>>>   includedir="${includedir:-$prefix/include}"
>>>>>   -if test "$mingw32" = "yes" ; then
>>>>> +if test "$mingw32" = "yes" && test "$mingw32_standalone" = "yes"; 
>>>>> then
>>>>>       mandir="$prefix"
>>>>>       datadir="$prefix"
>>>>>       docdir="$prefix"
>>>>> @@ -1897,6 +1902,7 @@ disabled with --disable-FEATURE, default is 
>>>>> enabled if available
>>>>>     libdaxctl       libdaxctl support
>>>>>     fuse            FUSE block device export
>>>>>     fuse-lseek      SEEK_HOLE/SEEK_DATA support for FUSE exports
>>>>> +  standalone-mingw  Build for standalone distribution on MinGW
>>>>>     NOTE: The object files are built at the place where configure 
>>>>> is launched
>>>>>   EOF
>>>>
>>>> I think this should maybe be done independently from MinGW, so that 
>>>> it could be used on other systems, too. Thus maybe rather name the 
>>>> switch "--enable-standalone-distribution" or 
>>>> "--enable-standalone-installation" or something like this? On MinGW, 
>>>> the value of the switch could then default to "yes" while on other 
>>>> systems it would be "no" by default.
>>>
>>> We could, but I'm curious how useful that is? Does that make the 
>>> option just a shorthand for "--mandir=$prefix --bindir=$prefix 
>>> --datadir=$prefix etc..." for all builds?
>>
>> Yes, that would basically be a shorthand for that. Could be useful for 
>> people who want to create standalone binaries on Linux etc., too.
>>
>>  Thomas
> 
> 
> Aren't nearly all files already rooted in $prefix? The only exception I 
> know is /etc/qemu.
> 
> Rooting in $prefix still allows hierarchical subdirectories. I'd prefer 
> them for MinGW, too.

I agree, it was an issue before 5.2 but now we have relocatable 
installations.  So it would be better to remove all the special casing 
of mingw, except that (for backwards compatibility) on mingw bindir 
defaults to $prefix instead of $prefix/bin.  Then Joshua's usecase is 
covered simply by --bindir=/mingw/bin.

Paolo


