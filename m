Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C79A619B2A2
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Apr 2020 18:46:25 +0200 (CEST)
Received: from localhost ([::1]:34778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jJgVU-00058I-Iz
	for lists+qemu-devel@lfdr.de; Wed, 01 Apr 2020 12:46:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36884)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1jJgUd-0004YK-38
 for qemu-devel@nongnu.org; Wed, 01 Apr 2020 12:45:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1jJgUc-0005ot-2q
 for qemu-devel@nongnu.org; Wed, 01 Apr 2020 12:45:30 -0400
Received: from 3.mo2.mail-out.ovh.net ([46.105.58.226]:60723)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1jJgUb-0005nJ-Tj
 for qemu-devel@nongnu.org; Wed, 01 Apr 2020 12:45:30 -0400
Received: from player695.ha.ovh.net (unknown [10.110.115.223])
 by mo2.mail-out.ovh.net (Postfix) with ESMTP id 26A821D13F8
 for <qemu-devel@nongnu.org>; Wed,  1 Apr 2020 18:45:27 +0200 (CEST)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player695.ha.ovh.net (Postfix) with ESMTPSA id 5CE2510E782C9;
 Wed,  1 Apr 2020 16:45:24 +0000 (UTC)
Subject: Re: [PATCH 2/2] ppc/xive: Add support for PQ state bits offload
To: David Gibson <david@gibson.dropbear.id.au>
References: <20200401154536.3750-1-clg@kaod.org>
 <20200401154536.3750-3-clg@kaod.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <665051d1-46df-f530-52b4-67fac018a8d0@kaod.org>
Date: Wed, 1 Apr 2020 18:45:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200401154536.3750-3-clg@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 14206323553715129152
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedrtddvgddutdegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpkedvrdeigedrvdehtddrudejtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrheileehrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrgh
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.58.226
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
Cc: qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

>  static void pnv_xive_ic_notify_write(void *opaque, hwaddr addr, uint64_t val,
> @@ -1939,6 +1968,8 @@ static void pnv_xive_class_init(ObjectClass *klass, void *data)
>      device_class_set_props(dc, pnv_xive_properties);
>  
>      xrc->get_eas = pnv_xive_get_eas;
> +    xrc->get_pq = pnv_xive_get_pq;
> +    xrc->set_pq = pnv_xive_set_pq;
>      xrc->get_end = pnv_xive_get_end;
>      xrc->write_end = pnv_xive_write_end;
>      xrc->get_nvt = pnv_xive_get_nvt;
> @@ -1967,7 +1998,8 @@ static const TypeInfo pnv_xive_info = {
>   *
>   * Trigger all threads 0
>   */
> -static void pnv_xive_lsi_notify(XiveNotifier *xn, uint32_t srcno)
> +static void pnv_xive_lsi_notify(XiveNotifier *xn, uint32_t srcno,
> +                                bool pq_checked)


oops. I haven't sent this yet. So this patch won't apply.

Sending a v2.

C. 

