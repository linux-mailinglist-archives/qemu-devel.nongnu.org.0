Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 168876608F7
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 22:54:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDuei-00010D-3w; Fri, 06 Jan 2023 16:53:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pDueg-0000zs-3t
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 16:53:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pDuee-0005Of-K0
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 16:53:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673042015;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WSZ1vKIzqHWk12uOpvcGAlHxJQrcJ0JSD/fWdpVNtdU=;
 b=ChxrU2dHqLC8fbRHyxVwfPtNdkGx0GMGJgZFBska3M4NY2W1QU2wsk27Of30YF7AbSgYIT
 e4YkiEAIyxW0es0vj9zJb2snvSsf/nkiZj6K2Rr5H/554Y8KhVe0s3j3Wxe1ZpBVdhATXR
 PQ4Rxj8fBYfre/RbztsxkRLHv84Mpaw=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-556-avEg6bRUM9O_jQeDC_ZvlA-1; Fri, 06 Jan 2023 16:53:34 -0500
X-MC-Unique: avEg6bRUM9O_jQeDC_ZvlA-1
Received: by mail-lf1-f72.google.com with SMTP id
 bq3-20020a056512150300b004b9c5dff97bso990265lfb.17
 for <qemu-devel@nongnu.org>; Fri, 06 Jan 2023 13:53:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WSZ1vKIzqHWk12uOpvcGAlHxJQrcJ0JSD/fWdpVNtdU=;
 b=im4uK/3ZaoJfohB1kr4rzG/DmrId3W6ySyXcNmifOQZL5hAfoHJ/Gn4wImzA7LUa+A
 l6AGlURv5BIUdmtd/Ae8Qar/rVQBLqZlfSwIXlYVGoO64HyLHV5FGVfU6AeoSl2s5bN1
 RTRev/411LSyNOPx2fKiNMINOhrj6A0qB3r/94B8ahUMx30qa92YLOHm8GhPGz4RWD3G
 NyVwl6aoEVL/Hs87xZqTL5sXgWh4zd/BkQSk7HJrume5dobH8s7LsOwz30HOB7P9AS+6
 FvvduBHcPv4g8fplE802FbmbVYznaaNkBD53ubYsMfRhhCIkzsDzFLUtfuci6Qyf8M4W
 ZK0g==
X-Gm-Message-State: AFqh2kp7P30BdxLh7LkZzbOlZ3KEB/IxgYI60LrCMKhL4L09X0bo631N
 qD+sP42J1pdTDe1M0ry+9h2wJvIQyPM3oMmqDGKXm6HJeXQCFjpu7EUt7dM3SQUkjepHXoXyT4+
 JzOWE4RCW1rC2wc8dDaaha8T8tdi014c=
X-Received: by 2002:a2e:a58a:0:b0:27f:d4ca:d927 with SMTP id
 m10-20020a2ea58a000000b0027fd4cad927mr1658967ljp.184.1673042012608; 
 Fri, 06 Jan 2023 13:53:32 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuo6kU2kefNw7018JBlFbc0adqkuQt3Pk/bXeVbDdSuafZzdzqK5FbVi+RdaSS2Tiovd/x2Ypub1pgc9XAClo0=
X-Received: by 2002:a2e:a58a:0:b0:27f:d4ca:d927 with SMTP id
 m10-20020a2ea58a000000b0027fd4cad927mr1658963ljp.184.1673042012334; Fri, 06
 Jan 2023 13:53:32 -0800 (PST)
MIME-Version: 1.0
References: <20230103221349.74160-1-arthur.sengileyev@gmail.com>
In-Reply-To: <20230103221349.74160-1-arthur.sengileyev@gmail.com>
From: John Snow <jsnow@redhat.com>
Date: Fri, 6 Jan 2023 16:53:20 -0500
Message-ID: <CAFn=p-bBtypjDK75sGDyji45rsykvFXbwsQAg1_CWGi9XrGzuQ@mail.gmail.com>
Subject: Re: [PATCH] Windows installer: keep dependency cache
To: Arthur Sengileyev <arthur.sengileyev@gmail.com>
Cc: sw@weilnetz.de, crosa@redhat.com, qemu-devel@nongnu.org, 
 qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On Tue, Jan 3, 2023 at 5:13 PM Arthur Sengileyev
<arthur.sengileyev@gmail.com> wrote:
>
> It should be possible to reuse cache built by previous iteration
> processing next executables. Already processed dependencies are
> already skipped later based on dll name.
>
> Signed-off-by: Arthur Sengileyev <arthur.sengileyev@gmail.com>
> ---
>  scripts/nsis.py | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/nsis.py b/scripts/nsis.py
> index 03ed7608a2..a2e52df556 100644
> --- a/scripts/nsis.py
> +++ b/scripts/nsis.py
> @@ -91,12 +91,13 @@ def main():
>          print("Searching '%s' for the dependent dlls ..." % search_path)
>          dlldir = os.path.join(destdir + prefix, "dll")
>          os.mkdir(dlldir)
> +        depscache = set()
>
>          for exe in glob.glob(os.path.join(destdir + prefix, "*.exe")):
>              signcode(exe)
>
>              # find all dll dependencies
> -            deps = set(find_deps(exe, search_path, set()))
> +            deps = set(find_deps(exe, search_path, depscache))
>              deps.remove(exe)
>
>              # copy all dlls to the DLLDIR
> --
> 2.39.0
>

ACK for python changes, which seem sane. I've not used the NSIS script
before, though, so I won't grant RB/TB here.

--js


