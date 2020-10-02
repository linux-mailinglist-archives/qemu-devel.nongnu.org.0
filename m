Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AFA628111A
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Oct 2020 13:18:21 +0200 (CEST)
Received: from localhost ([::1]:41390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kOJ4u-000895-DS
	for lists+qemu-devel@lfdr.de; Fri, 02 Oct 2020 07:18:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fam@euphon.net>) id 1kOJ3l-0007e8-CD
 for qemu-devel@nongnu.org; Fri, 02 Oct 2020 07:17:09 -0400
Received: from sender2-op-o12.zoho.com.cn ([163.53.93.243]:17503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fam@euphon.net>) id 1kOJ3g-0005K8-Py
 for qemu-devel@nongnu.org; Fri, 02 Oct 2020 07:17:09 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1601637383; cv=none; d=zoho.com.cn; s=zohoarc; 
 b=htH8jQvsuJALAO3byhSs5Xb/MeSxIXB83AbljhDebp9enIdScukNdqj7/hLNLlnImDGKcLA61TV5IG/uye5xkvVu771E429JlDcTrKR26P/EIjRveLeYI6e7pljnsuLIenf471VJ6HGTP/4f1hlt4ctFXr06IJ70rAbaqxLXdCU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com.cn;
 s=zohoarc; t=1601637383;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=L3tsXI5KoF3GngFP7LztPl4MHbdWlEbqflPX21DiiY4=; 
 b=RuFsOdPqCU/GHZ+fympiJvvDs2J8NSrUc2ajcl76w0z602buB8TfcfTDcZpuvlZnpZSSCMH225mkd/65A8Vpi6mjNreG0Y+3N/2hZDYlzW9k0RPcr3nEWdVYxPjmy0EuFGRIymbPw0pJck1/GY3Muz06m/zAZ2HuuEv2GIbceEQ=
ARC-Authentication-Results: i=1; mx.zoho.com.cn;
 dkim=pass  header.i=euphon.net;
 spf=pass  smtp.mailfrom=fam@euphon.net;
 dmarc=pass header.from=<fam@euphon.net> header.from=<fam@euphon.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1601637383; 
 s=zoho; d=euphon.net; i=fam@euphon.net;
 h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:Content-Type:Mime-Version:Content-Transfer-Encoding;
 bh=L3tsXI5KoF3GngFP7LztPl4MHbdWlEbqflPX21DiiY4=;
 b=gLozzhsliZqGHRqdIAQBAEwL7sGuQ3uHwJu3AEmdqd5q8eqN2OLrhYYIV8yqBYxa
 hJreize4hBwr61BbvKXBQXpaSuETYA5WZO2Sas6+3jnGE3f6PKVDhy5WhCTQ2znD9w0
 huHCt9j1AlBjze9XZbndRLXfq9idR4qA7PFEcQec=
Received: from u60bdefc337955a.ant.amazon.com (54.239.6.185 [54.239.6.185]) by
 mx.zoho.com.cn with SMTPS id 1601637381615207.0943374451299;
 Fri, 2 Oct 2020 19:16:21 +0800 (CST)
Message-ID: <a38759c3ee674da9f92f175e222ca2323402593e.camel@euphon.net>
Subject: Re: [PATCH v2] gitlab: move linux-user plugins test across to gitlab
From: Fam Zheng <fam@euphon.net>
To: Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>, 
 qemu-devel@nongnu.org
Date: Fri, 02 Oct 2020 12:16:15 +0100
In-Reply-To: <20201002103223.24022-1-alex.bennee@linaro.org>
References: <20201002103223.24022-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-ZohoCNMailClient: External
Received-SPF: pass client-ip=163.53.93.243; envelope-from=fam@euphon.net;
 helo=sender2-op-o12.zoho.com.cn
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/02 07:16:50
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>,
 Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 2020-10-02 at 11:32 +0100, Alex Benn=C3=A9e wrote:
> Even with the recent split moving beefier plugins into contrib and
> dropping them from the check-tcg tests we are still hitting time
> limits. This possibly points to a slow down of --debug-tcg but seeing
> as we are migrating stuff to gitlab we might as well move there and
> bump the timeout.
>=20
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

Hi Alex,

Unrelated to the patch: do we have custom runners on gitlab? I'm
exploring ideas to run vm based tests there.

Fam


