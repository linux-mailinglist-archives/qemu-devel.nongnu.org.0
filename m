Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D884A51BE5E
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 13:47:57 +0200 (CEST)
Received: from localhost ([::1]:49058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmZxc-0005Dd-SK
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 07:47:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nmZtx-00028W-QF
 for qemu-devel@nongnu.org; Thu, 05 May 2022 07:44:09 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:39953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nmZtv-0008TZ-I2
 for qemu-devel@nongnu.org; Thu, 05 May 2022 07:44:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=HZ2oLinZsjQwpTPQ28znuwKbGhxCITyjXzh/F4pnaa4=; b=jgKM4Nw9b8JLO2kXKNObxLkzHH
 oA5mhrl31cpjXwyMArq5MXc01XPOO67QkRCZ3b1frrbYfSejOUhydGx4tNs5o7A+QjNSlLH+hlHvv
 6Q+BB3gq2a28Zj557s6Oajm6W8MVNsBfJIXb5vj2vHYS4znom2L3+5lzq0I6CUjpZIVAKSLcJ1fDM
 KgvBLniLBWQtzz2aYjPoi5K+lwM39vCe0YJD6ANlLOAfBLPGvA13m/xCybuAvYF2a/A6N/Htwzsr6
 yvr/qWEZQPKiQouZoVC+wCeZ3BAICwtQweSK7unx7OFCOpsiGqKCTGqJqF+hKfDLNqZBdkUZ/xPBE
 f1exYSu/vFIkWYGfGcnK+qpo16N5yTpzHg1f7ADJASlO02VRk8ReaaNOUMJjHXjkZJ6MbMt/M9N3A
 k420pWtSSn62gCC6htIR1Lm9BR/6Br1n39hvHM6B/1TjXEA+jyD17fZLOyH7Z+T+LAFSp855rwXvN
 GWGjPJNn2l7ASaqxe93SgksdwI+2SeHcITDpdfnL6qEStIjvOb84LZu3fl+orCssevICUow84UIY7
 u8czyAt8kHBz6wUbQkqp9SeTz4OCIbmt4PSX2nVPon5Z/qCvsnHyYCJVqVkJKuVYvPf/gOtxDu1TY
 vQmlamaueuWWfC97F3lF8X1Gxmpsb05Qu8q6VQ4cw=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org, "Shi, Guohuai" <Guohuai.Shi@windriver.com>,
 Greg Kurz <groug@kaod.org>
Cc: "Meng, Bin" <Bin.Meng@windriver.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH 5/9] hw/9pfs: Add a 'local' file system backend driver for
 Windows
Date: Thu, 05 May 2022 13:43:33 +0200
Message-ID: <4564343.M1kaXOOn0d@silver>
In-Reply-To: <CH2PR11MB445462A54AC1006BD093737BEFC39@CH2PR11MB4454.namprd11.prod.outlook.com>
References: <20220425142705.2099270-1-bmeng.cn@gmail.com>
 <2749735.hgEqPgphOh@silver>
 <CH2PR11MB445462A54AC1006BD093737BEFC39@CH2PR11MB4454.namprd11.prod.outlook.com>
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

On Mittwoch, 4. Mai 2022 21:34:22 CEST Shi, Guohuai wrote:
[...]
> > > index 0000000000..aab7c9f7b5
> > > --- /dev/null
> > > +++ b/hw/9pfs/9p-local-win32.c
> > > @@ -0,0 +1,1242 @@
> > > +/*
> > > + * 9p Windows callback
> > > + *
> > > + * Copyright (c) 2022 Wind River Systems, Inc.
> > > + *
> > > + * Based on hw/9pfs/9p-local.c
> > > + *
> > > + * This work is licensed under the terms of the GNU GPL, version 2. 
> > > See
> > > + * the COPYING file in the top-level directory.
> > > + */
> > > +
> > > +/*
> > > + * Not so fast! You might want to read the 9p developer docs first:
> > > + * https://wiki.qemu.org/Documentation/9p
> > > + */
> > > +
> > > +#include "qemu/osdep.h"
> > > +#include <windows.h>
> > > +#include <dirent.h>
> > > +#include "9p.h"
> > > +#include "9p-local.h"
> > > +#include "9p-xattr.h"
> > > +#include "9p-util.h"
> > > +#include "fsdev/qemu-fsdev.h"   /* local_ops */
> > > +#include "qapi/error.h"
> > > +#include "qemu/cutils.h"
> > > +#include "qemu/error-report.h"
> > > +#include "qemu/option.h"
> > > +#include <libgen.h>
> > 
> > I'm not sure whether all of this (i.e. 9p-local-win32.c in general) is
> > really needed. I mean yes, it probably does the job, but you basically
> > add a complete
> > separate 'local' backend implementation just for the Windows host
> > platform.
> > 
> > My expectation would be to stick to 9p-local.c being OS-agnostic, and only
> > define OS-specific functionality in 9p-util-windows.c if needed.
> > 
> > And most importantly: don't duplicate code as far as possible! I mean
> > somebody
> > would need to also review and maintain all of this.
> 
> Actually, almost all FileOperations functions are re-written for Windows
> host.
> 
> Here is the comparison statistics for 9p-local.c and 9p-local-win32.c:
> Total lines : 1611
> Changed lines: 590
> Inserted lines: 138
> Removed lines: 414
> 
> For function level difference count:
> 
> Changed function: 39
> Unchanged function: 13
> 
> If use "#ifdef _WIN32" to sperate Windows host code, it may need to be
> inserted about 150 code blocks (or 39 code blocks for all changed
> functions).
> 
> I am not sure if it is a good idea to insert so many "#ifdef _WIN32", it may
> cause this file not readable.
> 
> If stick to 9p-local.c being OS-agnostic, I think it is better to create two
> new files: 9p-local-linux.c and 9p-local-win32.c

The thing is, as this is presented right now, I can hardly even see where 
deviating behaviour for Windows would be, where not, and I'm missing any 
explanations and reasons for the individual deviations right now. Chances are 
that you are unnecessarilly adding duplicate code and unnecessary code 
deviations. For me this 9p-local-win32.c approach looks overly complex and not 
appropriately abstracted on first sight.

I suggest waiting for Greg to give his opinion on this as well before 
continuing.

Best regards,
Christian Schoenebeck



