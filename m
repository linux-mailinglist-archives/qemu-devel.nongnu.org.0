Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 579DC5B38AE
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Sep 2022 15:13:03 +0200 (CEST)
Received: from localhost ([::1]:58458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWdob-00052h-TS
	for lists+qemu-devel@lfdr.de; Fri, 09 Sep 2022 09:13:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1oWdmd-0003Rv-KQ; Fri, 09 Sep 2022 09:10:59 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:60449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1oWdmY-0005TB-8M; Fri, 09 Sep 2022 09:10:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=IOC297hLJ9xVejGRMLx4cP5GzuItpDV2eoVbSaJ/SDE=; b=s83we5VNECf31KuE7Rgdbe9qf7
 jT39Ym2IXaDtAD8LFhLcBXkEoKR+pMKnIJEZnvS6N6h/j1ZMnHtk3+T8Ybr281hc/5Odw/Jk7U3YH
 cy1TZ/fgPkHJekXRb07rsHNoohxxRUsCxSxHsECLQyjxy753CeOt3BNfxzcW5Neo2PSFr9QOY1zAi
 lL2ba1SfcL0zZ/scuM91WRrvqpG68nBCQ4bRke22YCkSneRMg1wRjMyScC1/fLvu8W3NgrH7qmqYW
 EsDQrEpt6i4vEuj3o5A/9+bWVIjDcl4p9+cLwxGWZBRoTF3dr+jPhup5GPzfk3EPEAgTnGL/khMzk
 Sdfx+Rieh85QSwwPQmWqbpTvDGXlq96hg0d8pC0Q9Edo4D0VRrVycyDanA/J/kQBOr1OzyAu64VxI
 FdhpvntFO7kwDeUbhYfNVQ5zdnMbFkEwonU0xS7LAI3rX6ZAaNatZpPkEep9QJYSGe/xnjIFFBB22
 OjxdKrUdpEN5d8TjYDU9hBV7D63NfYCTzRnT14kZwRbcsucpbq6eawbmPFicDz29pxtdY65OJjdha
 kOpJTuwPQ86Joq6hPRwyBYURtq3jn/UtzauHsl12yV/AEBxDdmizrWCs+J7nh+/Ayw5Z4lh5Ok3fa
 JxiOZGjE84TdJxSxCmYpkPQ1pukpbf2UeZkirlJsI=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Qemu-block <qemu-block@nongnu.org>,
 Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <f4bug@amsat.org>,
 Daniel P =?ISO-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 Greg Kurz <groug@kaod.org>, Linus Heckemann <git@sphalerite.org>
Subject: Re: [PATCH v3] 9pfs: use GHashTable for fid table
Date: Fri, 09 Sep 2022 15:10:48 +0200
Message-ID: <1948479.BV7xhjtDqn@silver>
In-Reply-To: <20220908112353.289267-1-git@sphalerite.org>
References: <20220908112353.289267-1-git@sphalerite.org>
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
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Donnerstag, 8. September 2022 13:23:53 CEST Linus Heckemann wrote:
> The previous implementation would iterate over the fid table for
> lookup operations, resulting in an operation with O(n) complexity on
> the number of open files and poor cache locality -- for every open,
> stat, read, write, etc operation.
>=20
> This change uses a hashtable for this instead, significantly improving
> the performance of the 9p filesystem. The runtime of NixOS's simple
> installer test, which copies ~122k files totalling ~1.8GiB from 9p,
> decreased by a factor of about 10.
>=20
> Signed-off-by: Linus Heckemann <git@sphalerite.org>
> Reviewed-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
> Reviewed-by: Greg Kurz <groug@kaod.org>
> ---

Queued on 9p.next:
https://github.com/cschoenebeck/qemu/commits/9p.next

I retained the BUG_ON() in get_fid(), Greg had a point there that continuin=
g=20
to work on a clunked fid would still be a bug.

I also added the suggested TODO comment for g_hash_table_steal_extended(), =
the=20
actual change would be outside the scope of this patch.

And finally I gave this patch a whirl, and what can I say: that's just sick=
!=20
Compiling sources with 9p is boosted by around factor 6..7 here! And runnin=
g=20
9p as root fs also no longer feels sluggish as before. I mean I knew that t=
his=20
fid list traversal performance issue existed and had it on my TODO list, bu=
t=20
the actual impact exceeded my expectation by far.

Thanks!

Best regards,
Christian Schoenebeck



