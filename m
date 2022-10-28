Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86554610B06
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 09:08:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooJTO-00016S-QQ; Fri, 28 Oct 2022 03:08:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ooJSv-0000wE-Lc
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 03:07:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ooJSk-0007fP-0h
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 03:07:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666940848;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QvP+uJxR3DxkObgA/ubx80kSlOVOAco4z7vgnuM9I18=;
 b=LsxDr695NHAnnycwbi0X6hUF9/bd/1srJ6k/pr9TZ96eUNHoi3w54y//9OEZqTuLALhKwP
 qqSlDbb2l1Zs/8hC0VEM7kLTaweaDRx0vaAKoY+S3bqfOB9Y6rQTm2fY8kpNRB3F2CbiIX
 LMJjFRHh955426ADUiFzn+YxqXYh7Os=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-452-CO6dTwA4Ocmh4Un9PQYnrg-1; Fri, 28 Oct 2022 03:07:20 -0400
X-MC-Unique: CO6dTwA4Ocmh4Un9PQYnrg-1
Received: by mail-wm1-f72.google.com with SMTP id
 x10-20020a05600c420a00b003cf4dbff2e4so1431546wmh.8
 for <qemu-devel@nongnu.org>; Fri, 28 Oct 2022 00:07:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QvP+uJxR3DxkObgA/ubx80kSlOVOAco4z7vgnuM9I18=;
 b=imynul8uX7D85gwk4KAFz1i3CCXjRF++HSiY7HEmEIf712hT5q8qxThm44zrFdsijd
 0tzMIRJNWaD8y1E7JDWS6F2j39f5WAr2f6dIMCCYrfYzTsIcDaNq8EzurmG8DIcJ9Kgp
 6PQ51vGjsm7bOKbZoKLwTG2Ubkv6DsF8fuonpIpZ7TCurlwKIIu/B7btgpa7oMSiBKDZ
 bSCzMlUAQSZCV1+odv/bx27VopANLlToav0Hph/uAJaBDRL7DvQj01NNM5K7rhuvd2E+
 qQ3qoKxrv9GPGoKVblV0mjhYVEojlgfgAN3OWI7ZId0wkYSiaV76+MMYOtLt0CBJ7qcE
 GIXA==
X-Gm-Message-State: ACrzQf3u1yIhQWb43r6wI1GiZCd3Cd4Jg/Qsjo4+Enp98k7ZYZ9i8gR/
 /8m87A4mSzt23++zZSa/NUtYubCLG0F1QI2af/xTHvpAHgiO+lWvQc29v56SjW2VlZEHQ+9wxaP
 Oq6nkSeHYJY+zhrQ=
X-Received: by 2002:a5d:4e8c:0:b0:236:6f5a:e893 with SMTP id
 e12-20020a5d4e8c000000b002366f5ae893mr16315913wru.44.1666940839496; 
 Fri, 28 Oct 2022 00:07:19 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM62Z3JuzKNyu6GUhduaVXtk4Ro+LEVpCg2Qw36qR3kyvqvvA/QIUjes3+ja9rb/b4K9cKd2zA==
X-Received: by 2002:a5d:4e8c:0:b0:236:6f5a:e893 with SMTP id
 e12-20020a5d4e8c000000b002366f5ae893mr16315887wru.44.1666940839198; 
 Fri, 28 Oct 2022 00:07:19 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-177-14.web.vodafone.de.
 [109.43.177.14]) by smtp.gmail.com with ESMTPSA id
 bt6-20020a056000080600b0023677e1157fsm3080642wrb.56.2022.10.28.00.07.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Oct 2022 00:07:18 -0700 (PDT)
Message-ID: <85b322d3-04c4-bbb5-f0cf-4be1cd73d671@redhat.com>
Date: Fri, 28 Oct 2022 09:07:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PULL 00/23] 9p queue 2022-10-24
Content-Language: en-US
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Greg Kurz <groug@kaod.org>,
 Linus Heckemann <git@sphalerite.org>, Bin Meng <bin.meng@windriver.com>,
 Stefan Hajnoczi <stefanha@gmail.com>
References: <cover.1666608862.git.qemu_oss@crudebyte.com>
 <3438372.x9l1EUDYgq@silver>
 <CAJSP0QU62wy6sN7CULhDtcXMufQvpF8CgRQDOSVw5w7JYC_p-g@mail.gmail.com>
 <11340963.ZY6gCF45se@silver>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <11340963.ZY6gCF45se@silver>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 27/10/2022 22.42, Christian Schoenebeck wrote:
> On Thursday, October 27, 2022 7:37:07 PM CEST Stefan Hajnoczi wrote:
>> On Thu, 27 Oct 2022 at 12:38, Christian Schoenebeck
>> <qemu_oss@crudebyte.com> wrote:
>>>
>>> On Thursday, October 27, 2022 5:53:47 PM CEST Thomas Huth wrote:
>>>> On 24/10/2022 12.54, Christian Schoenebeck wrote:
>>>>> The following changes since commit 0529245488865038344d64fff7ee05864d3d17f6:
>>>>>
>>>>>     Merge tag 'pull-target-arm-20221020' of https://git.linaro.org/people/pmaydell/qemu-arm into staging (2022-10-20 14:36:12 -0400)
>>>>>
>>>>> are available in the Git repository at:
>>>>>
>>>>>     https://github.com/cschoenebeck/qemu.git tags/pull-9p-20221024
>>>>>
>>>>> for you to fetch changes up to 3ce77865bf813f313cf79c00fd951bfc95a50165:
>>>>>
>>>>>     tests/9p: remove unnecessary g_strdup() calls (2022-10-24 12:24:32 +0200)
>>>>>
>>>>> ----------------------------------------------------------------
>>>>> 9pfs: performance, Windows host prep, tests restructure
>>>>>
>>>>> * Highlight of this PR is Linus Heckemann's GHashTable patch which
>>>>>     brings massive general performance improvements of 9p server
>>>>>     somewhere between factor 6 .. 12.
>>>>>
>>>>> * Bin Meng's g_mkdir patch is a preparatory patch for upcoming
>>>>>     Windows host support of 9p server.
>>>>>
>>>>> * The rest of the patches in this PR are 9p test code restructuring
>>>>>     and refactoring changes to improve readability and to ease
>>>>>     maintenance of 9p test code on the long-term.
>>>>
>>>>    Hi Christian,
>>>>
>>>> I think this PR broke the FreeBSD CI jobs:
>>>>
>>>>    https://gitlab.com/qemu-project/qemu/-/jobs/3219611457#L3116
>>>>
>>>>    https://gitlab.com/qemu-project/qemu/-/jobs/3219611460#L3372
>>>>
>>>> Could you please have a look?
>>>>
>>>>    Thanks!
>>>>     Thomas
>>>
>>> I try, but will certainly take some days, especially as I currently don't have
>>> a BSD installation at hand to try the changes.
>>
>> QEMU has the automation to run FreeBSD builds locally (in a VM):
>> $ make vm-build-freebsd
>>
>> Not sure if that FreeBSD environment matches the one in Cirrus CI
>> though. If they are different then maybe it won't reproduce locally.
> 
> Something must be different, because e750a7ace492f0b450653d4ad368a77d6f660fb8
> compiles fine locally with `make vm-build-freebsd` and all tests pass, too.
> 
> Ideas?

You've got to --enable-werror to make it fail, try something like this:

make vm-build-freebsd J=8 TARGET_LIST=x86_64-softmmu \
      BUILD_TARGET=check-build DEBUG=1 \
      EXTRA_CONFIGURE_OPTS="--enable-werror"

  HTH,
   Thomas


