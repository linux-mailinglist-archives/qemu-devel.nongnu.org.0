Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A8D654755
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Dec 2022 21:38:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8SL0-0006bc-0O; Thu, 22 Dec 2022 15:38:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcel@holtmann.org>)
 id 1p8SKn-0006Zi-3M
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 15:38:33 -0500
Received: from coyote.holtmann.net ([212.227.132.17] helo=mail.holtmann.org)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcel@holtmann.org>) id 1p8SKl-0002Re-Mm
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 15:38:32 -0500
Received: from smtpclient.apple (p4fefcc21.dip0.t-ipconnect.de [79.239.204.33])
 by mail.holtmann.org (Postfix) with ESMTPSA id D7059CED22;
 Thu, 22 Dec 2022 21:38:30 +0100 (CET)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH v3 10/10] libvduse: Fix assignment in vring_set_avail_event
From: Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <9930d0ba-1771-91bc-75b8-9d3acf206037@redhat.com>
Date: Thu, 22 Dec 2022 21:38:30 +0100
Cc: qemu-devel@nongnu.org,
 mst@redhat.com,
 xieyongji@bytedance.com
Content-Transfer-Encoding: 7bit
Message-Id: <E1F9EB10-E2AD-4A9B-A6A7-BF2518D8ADBE@holtmann.org>
References: <cover.1671628158.git.marcel@holtmann.org>
 <88882e496f70a7f606eabfd8b6183cc2b148c222.1671628158.git.marcel@holtmann.org>
 <9930d0ba-1771-91bc-75b8-9d3acf206037@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
Received-SPF: pass client-ip=212.227.132.17; envelope-from=marcel@holtmann.org;
 helo=mail.holtmann.org
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Paolo,

>>  static inline void vring_set_avail_event(VduseVirtq *vq, uint16_t val)
>>  {
>> -    *((uint16_t *)&vq->vring.used->ring[vq->vring.num]) = htole16(val);
>> +    uint16_t *avail;
>> +
>> +    avail = (uint16_t *)&vq->vring.used->ring[vq->vring.num];
>> +    *avail = htole16(val);
> 
> That this doesn't warn is basically a compiler bug.
> 
> Please use memcpy instead, i.e.
> 
>  uint16_t val_le = htole16(val);
>  memcpy(&vq->vring.used->ring[vq->vring.num]), &val_le, sizeof(uint16_t));

excellent. Thanks for this. I included a version that fixes this for
libvhost-user as well.

Regards

Marcel


