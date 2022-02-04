Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1864A992C
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 13:20:16 +0100 (CET)
Received: from localhost ([::1]:33474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFxZW-0003d6-6C
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 07:20:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nFxRn-0000hu-Pe; Fri, 04 Feb 2022 07:12:15 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:40351)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nFxRl-000154-Vm; Fri, 04 Feb 2022 07:12:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=5XJF7H95m3k/1l831LRrvakROKBbfOfspmCpz5kcxo0=; b=AEWJYhOvZFcYrw7xxbevR9TQiJ
 SJ7jWzap54dBQBbBJx+CZl81cVNnHoj0QjrmKbrQ4Q8JPs6YRxKMmHGjFeTHFNCYVO6ueL4rvongm
 iO+n4y57iKkkY1DMF0umxNm6hpe1sXcvS6EpB+/jvImoPea0ifZBzdI576GR240XVlCHWrVJW+5I9
 YQAyE54RZSYOoEd6wlsyzAAuFOHJ8EIu8qHcnA0n7u7WBcg/grjsFXoPaoe/P02zoAiNRL8oZJSCe
 KEppzTjMY4a9StMSrMxY5nkpQVVv6JsGQ5IBlJl0L428pRknab7VStBsnBYonRjuFFifJ/fLWJfhw
 G4mWmvaP+ZKdCHtYNiE/US+lJhl1C8uPXhJiCLOQKDT1EFLpFC36LUn+U2n1PizJhjjOgYvxVREed
 4YUAlmuSksEFpjcfTpatt8m0XHnRWYARhtNhQmXRvyNd4tUoRL2aB2U7jqiB3Lp7aHzUaeqGCUURl
 /w0jWL232ZFAV20vBGEtru5cpSE0aLrNCzDfqHyY9IbJx3NI9QoLX1Q+QcmfVFUefc1O9+qbagZsF
 QSk4T62Z0Uchp/9FLQgdmLFKdMInVSrLBI2StSuonAR5fUDPU3CNqYQ57lgkFwL59KVEUwJQmzEJh
 OsunulO4U9N8zPyXqiiZh6LFql5WElhmIJikDHDKw=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: "Dmitry V. Levin" <ldv@altlinux.org>, Vitaly Chikunov <vt@altlinux.org>,
 qemu-stable@nongnu.org, Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH v2] 9pfs: Fix segfault in do_readdir_many caused by struct
 dirent overread
Date: Fri, 04 Feb 2022 13:12:10 +0100
Message-ID: <2627488.0S70g7mNYN@silver>
In-Reply-To: <20220204002237.GD7780@altlinux.org>
References: <20220128223326.927132-1-vt@altlinux.org>
 <20220204001516.n5ma26x3wxsoixeb@altlinux.org>
 <20220204002237.GD7780@altlinux.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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

On Freitag, 4. Februar 2022 01:22:38 CET Dmitry V. Levin wrote:
> On Fri, Feb 04, 2022 at 03:15:16AM +0300, Vitaly Chikunov wrote:
> [...]
> 
> > Yes but this will cause another abort() call. I am thinking about v3 fix
> > 
> > like this:
> >   struct dirent *
> >   qemu_dirent_dup(struct dirent *dent)
> >   {
> >   
> >       size_t sz = 0;
> >   
> >   #if defined _DIRENT_HAVE_D_RECLEN
> >   
> >       /* Avoid use of strlen() if there's d_reclen. */
> >       sz = dent->d_reclen;
> >   
> >   #endif
> >   
> >       if (sz == 0) {
> >       
> >           /* Fallback to the most portable way. */
> >           sz = offsetof(struct dirent, d_name) +
> > 			
> > 			strlen(dent->d_name) + 1;
> > 			
> >       }
> >       struct dirent *dst = g_malloc(sz);
> >       return memcpy(dst, dent, sz);
> >   
> >   }
> > 
> > Thus it will use strlen for simulated dirents and d_reclen for real ones
> 
> Makes sense.

Then maybe consider to leave your reviewed-by tag on today's v3 Dmitry, 
thanks! :)

Best regards,
Christian Schoenebeck



