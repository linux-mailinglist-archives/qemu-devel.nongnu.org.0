Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DCA05A28E1
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 15:55:50 +0200 (CEST)
Received: from localhost ([::1]:38264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRZoK-0001F5-VC
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 09:55:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1oRZMo-0003kc-Oo
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 09:27:23 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:54941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1oRZMm-00056X-On
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 09:27:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=NUlwV0LWlTEnCF2v5RngT+Ucx/cUOB3gPyBUSBP65B4=; b=LoYviQJ2gHlwYduRy/Htmqy87S
 FxFuRh0Jf0q9F4yL3BaG84VCW9xyxdu5okMbDmHcg3AtzMNoFHt725A0+JsR5PFVmbOU42+PvO9B4
 uxhrZo5qEOXR14DmJIB6ovFI4mKSd7eE9h1wt7LeHnIvrLAZGOAUsEf5Xiab5nsD/ETRuuEYTKAmj
 S90YtMUJrqsbyS8UTZov9qS66mjCGJvUCqdMuZO7jThXY+2j3sLpP5InfVVx+ajb+0vKApwPTBys2
 zdjFrqMqbVqH0g6zNXsRCqyE4bd/JAxXINb86OuXObXP8+81Tqc7hHwDIA5TBNIvQeKj5EJo8VP9e
 MiStWXoqQafFn6oySVmwlFmTCWxZpgjCnPCV3LfLnG1T9hecljku4F3uUMQi9t3vMFU+a6hQLywg0
 UEgg90cN2MZF6DxCkbRcKDW6V+wy+kv2sStciyasPP9ScMY2HdjNGFjEqZJQBraAIPQfQKNuIGLf3
 ariClJzQgkiWkR8+jQUS/ZHx1i+GS9MLePfFMGPglNjrncgCXWt3XySnWTx+Us4gfO505p5c704YG
 NIwPxE1VmDNeDj6JufveqFwORnXEtCQ1rBEOhx4ndiZnvfzABI+pxc6VQbIZSlwKV32Dt//kIdcRM
 8vnlnrZfAn7eGwLPY9hs76TGA2s7q1xIGkSLoET10=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>
Cc: Greg Kurz <groug@kaod.org>, Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH 09/51] fsdev/virtfs-proxy-helper: Use
 g_mkdir_with_parents()
Date: Fri, 26 Aug 2022 15:27:16 +0200
Message-ID: <5811000.L6mdvGygOm@silver>
In-Reply-To: <CAEUhbmWL95M5HAp6XHgRzPo4Zmcb24T1Pnd4P+S+ba7L4g8MJA@mail.gmail.com>
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
 <17308910.sOD9EhOjFm@silver>
 <CAEUhbmWL95M5HAp6XHgRzPo4Zmcb24T1Pnd4P+S+ba7L4g8MJA@mail.gmail.com>
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

On Freitag, 26. August 2022 14:38:27 CEST Bin Meng wrote:
> On Fri, Aug 26, 2022 at 7:16 PM Christian Schoenebeck
> 
> <qemu_oss@crudebyte.com> wrote:
> > On Freitag, 26. August 2022 12:30:20 CEST Bin Meng wrote:
> > > On Fri, Aug 26, 2022 at 6:09 PM Christian Schoenebeck
> > > 
> > > <qemu_oss@crudebyte.com> wrote:
> > > > On Mittwoch, 24. August 2022 11:39:47 CEST Bin Meng wrote:
> > > > > From: Bin Meng <bin.meng@windriver.com>
> > > > > 
> > > > > Use the same g_mkdir_with_parents() call to create a directory on
> > > > > all platforms.
> > > > 
> > > > The same would be g_mkdir(), not g_mkdir_with_parents(), so please use
> > > > that
> > > > instead.
> > > 
> > > No, g_mkdir() is a deprecated API.
> > 
> > Where did you got that from? AFAICS g_mkdir() does not seem to be
> > deprecated:
> > https://gitlab.gnome.org/GNOME/glib/-/blob/main/glib/gstdio.c#L1201
> > https://gitlab.gnome.org/GNOME/glib/-/blob/main/glib/gstdio.h#L131> 
> > > Search result (https://docs.gtk.org/glib/?q=mkdir) shows only
> > > g_mkdir_with_parents().
> > 
> > Yeah, but that does not say that it was deprecated.
> 
> Umm, correct. However I don't remember where I got the statement that
> it was deprecated.
> 
> Maybe I was misled by the doc. Do you know why does the doc not
> document g_mkdir()?

Maybe gtk-doc does not define G_STDIO_WRAP_ON_UNIX?

Other functions like g_chmod() are missing in the generated docs as well, 
whereas g_access() et al. are there, those are declared in both conditions.
 
> Regards,
> Bin



