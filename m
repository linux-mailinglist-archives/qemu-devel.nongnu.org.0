Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F1E1041C9
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Nov 2019 18:11:10 +0100 (CET)
Received: from localhost ([::1]:60984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iXTVV-0007Jl-71
	for lists+qemu-devel@lfdr.de; Wed, 20 Nov 2019 12:11:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52331)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iXTTv-0004iG-QN
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 12:09:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iXTTs-0006SP-Th
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 12:09:29 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:23393
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iXTTs-0006PX-OZ
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 12:09:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574269767;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0Meqy1tIvJqnZLdVQ2/n5U4XvzuSEfi86hEKlS8cMzc=;
 b=Iz66lhgUNEIoREx2CFDBt1ZFkaEluAKuqgvFfbt335yfRro6kXEW7CUpmePcmPaQl1DUcs
 5BOJAX+R/4qLB60anG1h6L3SQPaBepLg+AMZdQvBe3Yf81k7Z/nDI/N0OErEcn51MVyCQq
 Whwl20lV7Bw/RmQsAOdu8icEGdliR1k=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-174--UXJzJYKMnCXjREaz23pDw-1; Wed, 20 Nov 2019 12:09:25 -0500
Received: by mail-wm1-f72.google.com with SMTP id g14so5681031wmk.9
 for <qemu-devel@nongnu.org>; Wed, 20 Nov 2019 09:09:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gWEIX/hYyQmquWi3ckybHmMfEPFASX9AlUhduc96pic=;
 b=FlWoI1VGyzzaq77kbWO5NK4kHDs2Y8Tg5NlsAbZ6SL/FKjrTmUu506mtEGqYq6iOxP
 mrcLeW+A+XISwkSPrVHzY9ViiIlk0cSiPyRPZ/bcRUHcKA3Mdh2V1Uzmf7TJGcGCJY88
 0hHdDD7xegeJMmmYQekPtr/tpsxrgJcuuwwqETkFCXeH4VtbD/5GHt4U2oJiOn4Ct+LQ
 nXRcQKlV7HuOx0ZT0VVnsjSfuXCmIAekDGZEPNel01wMegHAi8ILQePUUR0bP/4bb0ET
 jNmYe0sERVyjnfvW+vWjd6VWSMgpbrfByB5nW/+sxbPkd7MJPU3lzmsUL+V2gSM5Gu3x
 9WiA==
X-Gm-Message-State: APjAAAVL9iWujnQ3x6tcJOpjKKbv/qD4Q3K7LYlUEJGmLtwB78QUzkvU
 j+t2dmI/1EWW/0+hvzhvdlVxRYAnFShc4+vOOb/gnKJ0eSakA3raFNePUPz+MzQPzI/Rz+5zGgH
 56APbdc7xEzAF+8g=
X-Received: by 2002:a1c:44b:: with SMTP id 72mr4367388wme.72.1574269764166;
 Wed, 20 Nov 2019 09:09:24 -0800 (PST)
X-Google-Smtp-Source: APXvYqybYzv6po4H2uskpmnLOraAvq5sQFgd9hqSZmhOau0iKh6KZOvYviLgz0bfqtm3xpZVFLhDlg==
X-Received: by 2002:a1c:44b:: with SMTP id 72mr4367356wme.72.1574269763883;
 Wed, 20 Nov 2019 09:09:23 -0800 (PST)
Received: from [192.168.1.35] (131.red-88-21-102.staticip.rima-tde.net.
 [88.21.102.131])
 by smtp.gmail.com with ESMTPSA id b15sm31368147wrx.77.2019.11.20.09.09.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Nov 2019 09:09:23 -0800 (PST)
Subject: Re: [PATCH] Add minimal Hexagon target - First in a series of patches
 - linux-user changes + linux-user/hexagon + skeleton of
 target/hexagon -
 Files in target/hexagon/imported are from another project and therefore do
 not conform to qemu coding standards
To: Laurent Vivier <laurent@vivier.eu>, Taylor Simpson
 <tsimpson@quicinc.com>, "riku.voipio@iki.fi" <riku.voipio@iki.fi>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <1574121497-2433-1-git-send-email-tsimpson@quicinc.com>
 <a77ce406-5307-cee8-8e0b-7c08056fb0df@redhat.com>
 <BYAPR02MB488666AA94EBB57C2A318004DE4C0@BYAPR02MB4886.namprd02.prod.outlook.com>
 <8c92b107-b707-b8a7-6284-5b1ed8e95897@vivier.eu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <3038b1f6-c679-979f-1e15-6a9b569cc17d@redhat.com>
Date: Wed, 20 Nov 2019 18:09:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <8c92b107-b707-b8a7-6284-5b1ed8e95897@vivier.eu>
Content-Language: en-US
X-MC-Unique: -UXJzJYKMnCXjREaz23pDw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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

On 11/19/19 7:13 PM, Laurent Vivier wrote:
> Le 19/11/2019 =C3=A0 18:22, Taylor Simpson a =C3=A9crit=C2=A0:
>> Thanks for all the feedback on the patch.  I'll summarize my TODO list h=
ere.  Please let me know if there's anything I missed.
>> - Add a README file in the imported directory to make it clear that the =
code comes from another project.  Personally, I prefer keeping the name as =
"imported".  It was suggested by Richard at the meeting.  Also as a heads-u=
p, that is a small subset of the files that will be in that directory event=
ually.  Right now, it is the minimum needed to build the skeleton target.
>> - Work on the .checkpatchignore as Philippe suggested.
>> - Split out the "[__SIGRTMAX - 1] =3D __SIGRTMIN + 1" into a separate pa=
tch.
>> - Clean up the long subject line.
>> - Add license text to the new files.
>> - Remove the DEBUG_HEX blocks.  In general the DEBUG_HEX macro controls =
a bunch of debugging output as you'll see in later patches.  In the long ru=
n, I think it should be replaces with a macro that is defined when configur=
ed with --enable-debug and then an additional command-line argument.  I hav=
en't looked into this, so any pointers would be appreciated.
>=20
> You can have a look to the trace infrastructure
> (docs/devel/tracing.txt). We have also some qemu_log() macros for low
> level debugging.
>=20
>> - Laurent suggested I split the patch into two parts: linux-user and tar=
get/hexagon.  If I do that, which one should contain the changes to common =
files (e.g., configure)?  Also, note that we won't be able to build until b=
oth patches are merged.  Is that OK?
>=20
> You should add target/hexagon first, and it should not be build as we
> don't have any target (hexagon-linux-user or hexagon-softmmu),
> then you can add linux-user part that will be built and use the
> target/hexagone CPU. I think the configure part should go to the
> linux-user part as it enables the build.

If you have a CPU in target/hexagone, you should be able to link=20
hexagon-softmmu and run 'hexagon-softmmu -M none -m $SIZE -S -s', this=20
starts a CPU with $SIZE MiB of ram mapped at 0, and wait for gdb on port=20
1234. From here you can use 'load binary' to load some code in memory,=20
set breakpoints, and test your CPU (and TCG).

Then I'd continue with linux-user. If you already have it, that's easier.

>=20
> I asked to split the patch for review purpose, but this should not break
> anything (to allow bisect).
>=20
> Thanks,
> Laurent


