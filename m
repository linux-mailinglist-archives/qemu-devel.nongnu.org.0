Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2486749BAB7
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 18:57:01 +0100 (CET)
Received: from localhost ([::1]:50774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCQ3w-0005l7-6J
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 12:57:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nCPz6-0007lR-8d
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 12:52:00 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:33189)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nCPz4-00033C-2z
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 12:51:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=v9eVm5wCi/O3cuOebSpT94Wv085tYEJxh0wIH2ZY4ao=; b=sAJERnVY+p0oUg7MP1q9raTRVy
 dglrLq8DhmcSOGWn8LzxKNX3PhZtFb1N8FHAXxJtmb5dhryOgDI9jvIS/LpTc+MG+/qW5LTCQYviL
 Txml3HamHSIZpmJqeX1iN5AJLCF0ylBat323/ZoD/FsC4lSztszAzJAIZbggsw6djmiYw0zytEH/U
 X8PuS1HTdtaTufWoj8h9kptbG8SLAqXnqkt1YdH6uhZmFFuF2V8AT3XBG94NrfiTC0JPYc6C2z1qD
 rjTcu6PUclFVF9CBOVUItgOHh8KKhsO3Shedk+HRwJCzUP9qhtX5V/PrLolgMXk/deCak09ill69d
 +HUi1ruQ6wb/BhCVQ7bru7WUYweP3l+5LxXOtCv7rt40nvQNfGQ4ZzYLLIt3nh0Z5wSfzCdj0VDT6
 ZHn9njo2Wg3/Ekx67/Zp+kwqXCUAhDysaqf40ItZnr2BjDxsPOcHDESATfWXDxXxalpFRhs5YyUpl
 0BFYYDS/Jvd3yGB0Ig1wWxa5v/xXB9w39U3Q7wj5SsPepi2Izj22CsvJvY53p11GOcWo8ny/r9Ly8
 EcDNnn8etoaXvShtzNny7rkyGSdVTfglUqjso/Hhh5nnQJvo6dUFE+hgKffJJJPS4FC6oCErDGnTX
 uqaxXqmQftypyexNYhukPeHhTmlBjw/KKAuxM77Lw=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>,
 Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Daniel =?ISO-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH] tests/9pfs: fix mkdir() being called twice
Date: Tue, 25 Jan 2022 18:51:54 +0100
Message-ID: <3438847.JacDP26HMr@silver>
In-Reply-To: <20220125163346.4cb345ce@bahia>
References: <f6602123c6f7d0d593466231b04fba087817abbd.1642879848.git.qemu_oss@crudebyte.com>
 <20220125163346.4cb345ce@bahia>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Dienstag, 25. Januar 2022 16:33:46 CET Greg Kurz wrote:
> On Sat, 22 Jan 2022 20:12:16 +0100
>=20
> Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > The 9p test cases use mkdtemp() to create a temporary directory for
> > running the 'local' 9p tests with real files/dirs. Unlike mktemp()
> > which only generates a unique file name, mkdtemp() also creates the
> > directory, therefore the subsequent mkdir() was wrong and caused
> > errors on some systems.
> >=20
> > Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > Fixes: 136b7af2 (tests/9pfs: fix test dir for parallel tests)
> > Reported-by: Daniel P. Berrang=E9 <berrange@redhat.com>
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/832
> > ---
>=20
> Reviewed-by: Greg Kurz <Greg Kurz <groug@kaod.org>

Hey, a live sign. :)

> Unrelated, the template pointer is leaked. It looks like g_autofree would
> help here. I'll post a follow-up to fix that.

This man knows what I like to read!

Best regards,
Christian Schoenebeck



