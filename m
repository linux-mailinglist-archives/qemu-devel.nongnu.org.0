Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 809B518F246
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Mar 2020 10:59:24 +0100 (CET)
Received: from localhost ([::1]:59458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jGJrf-0005jZ-JB
	for lists+qemu-devel@lfdr.de; Mon, 23 Mar 2020 05:59:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57162)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1jGJqp-0005Hp-L6
 for qemu-devel@nongnu.org; Mon, 23 Mar 2020 05:58:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1jGJqn-0005Xg-RN
 for qemu-devel@nongnu.org; Mon, 23 Mar 2020 05:58:31 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:38985)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1jGJqm-0005Wt-Dl
 for qemu-devel@nongnu.org; Mon, 23 Mar 2020 05:58:29 -0400
Received: by mail-wr1-x42c.google.com with SMTP id p10so3735605wrt.6
 for <qemu-devel@nongnu.org>; Mon, 23 Mar 2020 02:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=kWQvqzqBNioVtylqs1hbQC45XA7rPP9eOScH/81hhvc=;
 b=XcP54aBx+nNIqseG6SOMF0Mf0m1Enr7AZqvJrtfEPYO76Cvdt2HghGlkuhkAmFyrbE
 H+4KfM7OIKwPId37UnjXZNJmPLh7m8LcJ7v1spJK5Mz+O2fDZ2yvtee5Hv7mUnvUbqpz
 fzI9/W3ogIRw2baE6Xz/RpwolNPQ1MIHw3Ei2Qpa8zbYL+zyy6hZWmhKhMOrWUJfgL7x
 67fM60KIAjS0GCW7PQLOXUe4mxgD4xtB97Ee+/d5JXwsD3a0sq2P0flnJPd52mtwbypy
 JY6mzTqmhaido1nWTHt0p3D8SL3/rkQLVwDQPMPysoBpi9WdMyhLs+13XPmvYzHCompK
 9hRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=kWQvqzqBNioVtylqs1hbQC45XA7rPP9eOScH/81hhvc=;
 b=d0uAEWYGJoqIp4v+hgS7iB90rSvZ+K0zhseRPNhaw9VMG4Ww8TfsqHpLo+y1AX4Sen
 DUwIWehp031ep0E4sWt8B81VdH74M/1M1TZUFhDAPEjo4AUUITZPhpcs28g5zcaWHBdC
 ryftsDsSoVQ89CyNuQma2YJINQF7hizvvDAk0nVSguITASNLZKbmF49fMCimBPcJKooY
 91mNiAJqN/2Xx4PRvQEqxOLvEYXKEaqyI1SJMjqvY9xMN3T1SWEtkX4Nq/yF1CSC/Fth
 ix0PYaeFsFksyGpDmd+ZSXlSZkH/SKW/osOMUHsN7ByHh5uUjfN04XT04OC9lJdCiG52
 +h9g==
X-Gm-Message-State: ANhLgQ1htM5OpJSGJpZ+ntt8WNgORrzb/fp6vqVcc6CR/FnqpgVOqObI
 jSkymAe2SDE1GBYMkXVuGKLpKg==
X-Google-Smtp-Source: ADFU+vthta4Um+rcK2yEJVKT3zPXbOkmXzfpau0CyKoTcLQzo78vgNgUQcvPxapp01L5sLQ4WwFChg==
X-Received: by 2002:a5d:5286:: with SMTP id c6mr28446302wrv.418.1584957506129; 
 Mon, 23 Mar 2020 02:58:26 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c189sm2289435wmd.12.2020.03.23.02.58.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2020 02:58:24 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EDB1A1FF7E;
 Mon, 23 Mar 2020 09:58:23 +0000 (GMT)
References: <20200322120104.21267-1-philmd@redhat.com>
User-agent: mu4e 1.3.10; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH-for-5.0 v2 0/4] tests/docker: Fixes for 5.0
In-reply-to: <20200322120104.21267-1-philmd@redhat.com>
Date: Mon, 23 Mar 2020 09:58:23 +0000
Message-ID: <87mu87bdfk.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::42c
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
Cc: Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> Easy fixes for our Docker images.

Queued to testing/next, thanks.

>
> Since v1:
> - Reword gcrypt patch description (requested by Aleksandar)
>
> Philippe Mathieu-Daud=C3=A9 (4):
>   tests/docker: Keep package list sorted
>   tests/docker: Install gcrypt devel package in Debian image
>   tests/docker: Use Python3 PyYAML in the Fedora image
>   tests/docker: Add libepoxy and libudev packages to the Fedora image
>
>  tests/docker/dockerfiles/centos7.docker      |  6 ++++--
>  tests/docker/dockerfiles/debian-amd64.docker |  1 +
>  tests/docker/dockerfiles/fedora.docker       | 10 +++++++---
>  3 files changed, 12 insertions(+), 5 deletions(-)


--=20
Alex Benn=C3=A9e

