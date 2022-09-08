Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 937AF5B2390
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 18:26:06 +0200 (CEST)
Received: from localhost ([::1]:33112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWKLt-0004TM-Cv
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 12:26:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@sphalerite.org>)
 id 1oWK6x-0000mi-N1; Thu, 08 Sep 2022 12:10:39 -0400
Received: from sosiego.soundray.org ([2a01:4f8:c2c:a9a0::1]:53874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@sphalerite.org>)
 id 1oWK6v-0005vx-8r; Thu, 08 Sep 2022 12:10:39 -0400
From: Linus Heckemann <git@sphalerite.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sphalerite.org;
 s=sosiego; t=1662653431;
 bh=Uwe4YGz1W6ZqpkIxdQQY+a2Ar6vDLizTjQrQWwEPO4c=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date;
 b=2uWpeA8QTW2E9sQxpzYSVIoPd2iVt3FqMEROBnd2WqAK7QKH/WcNEvl2j+F0UCstN
 +Sq5wyjQ1W3UteWaqDfQcDKdgnJf+L/eJkLSnBlU8jdE1XtTabPS3yNJKXH//cVfTK
 QrHkawAjU/pxPX7nUMkTmVqyLIMh6J/K9fwTQA20=
To: Greg Kurz <groug@kaod.org>
Cc: qemu-devel@nongnu.org, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Qemu-block <qemu-block@nongnu.org>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>, =?utf-8?Q?Daniel_P_=2E_Berrang=C3=A9?=
 <berrange@redhat.com>
Subject: Re: [PATCH v3] 9pfs: use GHashTable for fid table
In-Reply-To: <20220908141841.6a451d85@bahia>
References: <20220908112353.289267-1-git@sphalerite.org>
 <20220908141841.6a451d85@bahia>
Date: Thu, 08 Sep 2022 18:10:28 +0200
Message-ID: <ygaillx6e4r.fsf@localhost>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=2a01:4f8:c2c:a9a0::1;
 envelope-from=git@sphalerite.org; helo=sosiego.soundray.org
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

(sorry for the dup @Greg, forgot to reply-all)

Greg Kurz <groug@kaod.org> writes:
>> > g_hash_table_steal_extended() [1] actually allows to do just that.
>> 
>> g_hash_table_steal_extended unfortunately isn't available since it was
>> introduced in glib 2.58 and we're maintaining compatibility to 2.56.
>> 
>
> Ha... this could be addressed through conditional compilation, e.g.:

It still won't compile, because we set GLIB_VERSION_MAX_ALLOWED in
glib-compat.h and it would require a compat wrapper as described
there. I think that's a bit much for this far more marginal performance
change. I'm happy to resubmit with the TODO comment though if you like?

