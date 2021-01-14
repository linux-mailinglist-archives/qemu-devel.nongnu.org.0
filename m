Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E40D2F6E23
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 23:25:48 +0100 (CET)
Received: from localhost ([::1]:43034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0B3q-00069J-RN
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 17:25:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1l0B1v-0004iE-DF; Thu, 14 Jan 2021 17:23:47 -0500
Received: from mail.kernel.org ([198.145.29.99]:54794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1l0B1t-0005pk-SX; Thu, 14 Jan 2021 17:23:47 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 65C2B22CBE;
 Thu, 14 Jan 2021 22:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610663022;
 bh=nflGlTacw60Z/o85HdurV9NQIsXuJv8zPu7JeJDWRWc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=A7OA3hhVDYUKvK+DshXwAqf+geut96Ww1I69y/dz2kXHPV4F1dDTZqWJnKidv3YzA
 79iFJ2S9f+v1TgHmPt7eGGYPuYa9NfSbw9bCZMKVdgaY2q4HPO2OXR/MBSciDAuvwH
 WwADnemZiSe0acLrQIFOFnhl9Mz7fkWvFnQZrVqN+mTTSrC4TQD/JZeumJPHh9CV62
 4iWS7C9TQFNceVeZ+VV4cz3FRan5LoWvdZZYKiDdDfKjlRM1lbaWQAyueThBo+nTM4
 GmnexVV4b6Pdgk9G4ndHoHfzq/pI8eqY9P/R6z8uRRmSLIt7mebwNwLROmKGZ0tzbV
 CWr4j2t5t0APA==
Date: Thu, 14 Jan 2021 14:23:40 -0800
From: Keith Busch <kbusch@kernel.org>
To: zhenwei pi <pizhenwei@bytedance.com>
Subject: Re: [PATCH v3 3/4] hw/block/nvme: add smart_critical_warning property
Message-ID: <20210114222340.GA1511902@dhcp-10-100-145-180.wdc.com>
References: <20210114072251.334304-1-pizhenwei@bytedance.com>
 <20210114072251.334304-4-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210114072251.334304-4-pizhenwei@bytedance.com>
Received-SPF: pass client-ip=198.145.29.99; envelope-from=kbusch@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -72
X-Spam_score: -7.3
X-Spam_bar: -------
X-Spam_report: (-7.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 mreitz@redhat.com, its@irrelevant.dk, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 14, 2021 at 03:22:50PM +0800, zhenwei pi wrote:
> +static void nvme_get_smart_warning(Object *obj, Visitor *v, const char *name,
> +                                   void *opaque, Error **errp)
> +{
> +    NvmeCtrl *s = NVME(obj);

With only one exception, all variables of type 'NvmeCtrl' in this
program are called 'n', so let's keep that consistency please.
Otherwise, this looks fine.

> +    uint8_t value = s->smart_critical_warning;
> +
> +    visit_type_uint8(v, name, &value, errp);
> +}
> +
> +static void nvme_set_smart_warning(Object *obj, Visitor *v, const char *name,
> +                                   void *opaque, Error **errp)
> +{
> +    NvmeCtrl *s = NVME(obj);

