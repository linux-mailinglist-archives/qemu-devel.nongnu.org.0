Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F436829D8
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 11:02:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMnSr-00051N-Lc; Tue, 31 Jan 2023 05:02:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pMnS8-0004yG-5H
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 05:01:27 -0500
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pMnS6-0007ix-7K
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 05:01:23 -0500
Received: by mail-lf1-x133.google.com with SMTP id v17so17504570lfd.7
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 02:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ajc+gWFxhPdaIosrhavF1qq/gw+lyOeyL64IewFWbE8=;
 b=JZW/uxrMZpeAY9bCz/bNxX4Kek8a7iWZTgu8N97ssHLMvJWYcNVckI3DuH1l4oHUgI
 MSKOzqMSbFdaWANXVKiAnICyvet0bUyyU5k4YaOdu8pGuE28eXDB+gFlVp4yu7IJpZLz
 gNa5KcNZaNIwxDEBcDYpC6DMM5rSGSmTFn8PmKaZVUKdxWanvQ3J97O9NvVnKkUtAddM
 7XmzJ+8iKNA4OqWWVpHOMV6kvtiosfSEqVszE2jJ+nsKcOUcSD4GG1vuE+kTpHG+zfbH
 PKa3Vkllhh1jxMYlNIrDFP3sOvSCpDdTS7fV3AbnqCT9ttxNXqOSCF+QvlBj6YxtY3Z7
 WB7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ajc+gWFxhPdaIosrhavF1qq/gw+lyOeyL64IewFWbE8=;
 b=f4n0h2SHrKC5Zq0+H3hxBFA0erHPyaar4THh/zqZn7uvWURjRKAxsAMxelzs9deW1Z
 HdIGVuJ6WmcJJiUCVT+aMhuICpUaghAGpnVVVkvv5GY8yDVvBgwhCd8Vv0+tQZmclv5v
 BvvO32oBtbjsIt6fhi7QDkZlfXSBRNl/QeEkNbh7RdmnlmJjvB2APs5sly9dbjpLJSxK
 r0MOTMNutqaVGU8U0kvtay6r9oCGqImInAb7GbCo5EZkNshAcD/7PIK1Nc+yQFh4Y+nk
 x4fcVTXMGZUTDflC8ow0Ov2gzdjfNKn0qyCncTQBfVOc9tVLHTKRtFLdxCVD/m30sH/R
 czgQ==
X-Gm-Message-State: AO0yUKVsRLGCq/lhDpXuOTUJlshLbVzMdFsJKMOhz7/H+Pdr7fiHhtb8
 LLBPuvGYLVe1O+w2STswXfagLlOXuRm1Hdvkrg4=
X-Google-Smtp-Source: AK7set/lkObIdMashlUvXu6jYUEPeyw0HWvr3EvRo2PRpISzGLYwwQ9ZiuaGSDRDEQfWOCtvRyZ7BTjDd4HtkT4d5sg=
X-Received: by 2002:ac2:5985:0:b0:4d6:d63d:bfab with SMTP id
 w5-20020ac25985000000b004d6d63dbfabmr2962804lfn.80.1675159279128; Tue, 31 Jan
 2023 02:01:19 -0800 (PST)
MIME-Version: 1.0
References: <20230116013421.3149183-1-jeb.study@gmail.com>
 <CAJ+F1C+x3tSHAb6LbL+GK0m08UuKCS0RWygz41gMFycqL0JrrQ@mail.gmail.com>
 <Y8UXR6uqdv22auoE@redhat.com> <db09ab65-a6a7-0096-625a-c323a4b5aacf@gmail.com>
In-Reply-To: <db09ab65-a6a7-0096-625a-c323a4b5aacf@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 31 Jan 2023 14:01:07 +0400
Message-ID: <CAJ+F1CKkqcgCYfnGVK7LSD5gE1ueX2HrCGqP26_UJZYt3E-q4A@mail.gmail.com>
Subject: Re: [PATCH v2] Fix exec migration on Windows (w32+w64).
To: "John Berberian, Jr" <jeb.study@gmail.com>, Stefan Weil <sw@weilnetz.de>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::133;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x133.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi

On Tue, Jan 17, 2023 at 9:07 PM John Berberian, Jr <jeb.study@gmail.com> wr=
ote:
>
> Apologies for the late response, I was traveling most of yesterday.
>
> On 1/16/23 4:22 AM, Daniel P. Berrang=C3=A9 wrote:
> > When we introduce a new QAPI format for migration args though, I've
> > suggested we drop support for passing exec via shell, and require an
> > explicit argv[] array:
> >
> >    https://lists.gnu.org/archive/html/qemu-devel/2023-01/msg01434.html
> >
> > For Windows since we don't have back compat to worry about, we
> > can avoid passing via cmd.exe from the start.
>
> I think we should keep the behavior the same on all platforms. If such a
> change is to occur, it should happen at the same time on Windows and
> Unix-like systems. Platform-dependent ifdefs should be used to overcome
> platform-specific differences (e.g. the location of the shell), rather
> than give one platform entirely different functionality - otherwise we
> introduce needless confusion when someone accustomed to Linux tries to
> use an exec migration on Windows and it doesn't work the same way at all.

I agree with Daniel, we should make the migrate/exec command take an
argv[] (not run through the shell) and deprecate support for "exec:.."
in QMP. The "exec:..." form support could later be moved to HMP...

Tbh, allowing fork/exec from QEMU is not a great thing in the first
place (although with GSpawn using posix_spawn on modern systems, that
should help.. and win32 has a different API).

Instead, QMP/HMP clients could handle consumer process creation, and
passing FDs via 'getfd,' and using the migrate 'fd:fdname' form (that
is not really possible on win32 today, but I am adding support for
importing sockets in a series on the list. This should do the job now
that win32 supports unix sockets. We could also add support for pipes
for older windows, and other kind of handles too). I admit this is not
as convenient as the current "exec:cmdline" form... I don't know
whether we have enough motivation to push those changes... I see it
fitting with the goal to make HMP a human-friendly QMP client though.

In the meantime, I guess we should take the proposed patch.

Stefan, as win32 maintainer, any opinion?




--
Marc-Andr=C3=A9 Lureau

