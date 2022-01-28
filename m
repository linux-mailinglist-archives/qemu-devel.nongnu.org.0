Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 146E849FE52
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 17:48:02 +0100 (CET)
Received: from localhost ([::1]:56162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDUPp-00043R-4A
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 11:48:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nDTUC-0001oT-IT
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 10:48:28 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:41875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nDTU2-0000Z6-Eu
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 10:48:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=+Djqbf0HNRzWcbqWLhvsDnp8xM9kJsNAGlJQtKwZHGo=; b=ZMcChjhRQTvIRWyQyqY/wugO8V
 mnJ6qoRfG4BAyMpVkrAqCmiBUs6mBxopX2eKfiIn4OMyuwxBdbAORN/4gXGzSALV3BARdZBONA16G
 TI/5ozeNla3XfVUjSNJxFnl9NLOeCyHf08p9fq2Q4XTv5FWTFG+spT2uqm/tezdW9C8RGIlw4Lv0j
 QHS3nXQw2hVbviVo2z2rL2GiOe2a3qX02TlO/cB6mpnWwP1kZYBQZ0AWLfpm09oeIlf0oiDeK0ks1
 zyuuFCFG2LcJgsYp3B2bTu3xLb/8YeFtNLABi/9bg6JujM2bBg0BcgINOfVn1dsfPc1bCepxd0ZHB
 juT4EY1XT9VvjBAKPm3IIV13G9T60J67tprkCGeeOARca6fHekZLExWyoIeUpvd58hhuXByBttlFs
 KMzndS6uWP2GFQV7Nx2mCHJ6vVn3U2Cmx/UfuH+I0QzDCT2zcdJSy5kD7uMyzoqI0uJY28XTbkJmg
 2Qjlvtw+OtgwiaTQwsHBcbZNXkyAXUL8DkKkSdC390CtsBZAnX3QR1G8gAUjGfvUykn7BEWDQb2CY
 YYSE0ZwbE6fy3IoICa2Uf62AvxPdDRT9kDV76qKx13huXETZWJybmMUWdt+55y6bPbQ+bm5eTm4Tw
 wDrGUnM13jyLcBmUPH+Gc4g7VK8+2f9L/T5cNwqhw=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Will Cohen <wwcohen@gmail.com>, Keno Fischer <keno@juliacomputing.com>,
 Michael Roitzsch <reactorcontrol@icloud.com>, hi@alyssa.is,
 Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH v2 04/11] 9p: darwin: Handle struct dirent differences
Date: Fri, 28 Jan 2022 16:48:00 +0100
Message-ID: <12546246.2XztgVCrSq@silver>
In-Reply-To: <CAB26zV0T+mwNCDt9fYKy5hkV=8dnA=CFcu8K5X6Lo+WhFtEO2Q@mail.gmail.com>
References: <20211122004913.20052-1-wwcohen@gmail.com>
 <1746653.fRNRREnWfK@silver>
 <CAB26zV0T+mwNCDt9fYKy5hkV=8dnA=CFcu8K5X6Lo+WhFtEO2Q@mail.gmail.com>
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

On Donnerstag, 27. Januar 2022 22:48:02 CET Will Cohen wrote:
> If acceptable, we'd still propose leaving these changes as is for
> expediency's sake, rather than using our dirent and then translating it all
> to save one read from the FS layer.

The problem is V9fsFidState *fidp is a shared resource that might become 
mutated by other threads in between and could therefore lead to concurrency 
issues and undefined behaviour, whereas struct dirent is a local resource not 
being shared.

See also BTW:
https://lore.kernel.org/qemu-devel/20220127212734.218900-1-vt@altlinux.org/

Best regards,
Christian Schoenebeck



