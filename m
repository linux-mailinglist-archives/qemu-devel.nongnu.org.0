Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D34521B8D26
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Apr 2020 09:05:05 +0200 (CEST)
Received: from localhost ([::1]:53604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jSbLc-0002i1-DJ
	for lists+qemu-devel@lfdr.de; Sun, 26 Apr 2020 03:05:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45546)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jasowang@redhat.com>) id 1jSbIu-0000pw-T6
 for qemu-devel@nongnu.org; Sun, 26 Apr 2020 03:02:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <jasowang@redhat.com>) id 1jSbIt-0004tq-3q
 for qemu-devel@nongnu.org; Sun, 26 Apr 2020 03:02:15 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:24012
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1jSbIs-0004s3-Mc
 for qemu-devel@nongnu.org; Sun, 26 Apr 2020 03:02:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587884533;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qJty0LKEeiXJKmTzKszEc1uSZHzf8nlUYXITNsARy9I=;
 b=TWoy/SKHYXg508OslRj3zdeha6LaOb6JIBKYXklfEdhkQ/vTKCQlAp00fmC74jTHvktiff
 s0K+CrBIJYhtNzgd6FwEir3YkAnEIk7PdHfGffC89Rb2OYHxbBqdP+LIP9YsjD4WeX2AYf
 CX9uIJmns8uMK8WObm1oUsMMUbx2uCA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-345-L239sqTQPFqmm6tTZZIjug-1; Sun, 26 Apr 2020 03:02:09 -0400
X-MC-Unique: L239sqTQPFqmm6tTZZIjug-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D69B6800688;
 Sun, 26 Apr 2020 07:02:07 +0000 (UTC)
Received: from [10.72.13.103] (ovpn-13-103.pek2.redhat.com [10.72.13.103])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8F2B910016E8;
 Sun, 26 Apr 2020 07:02:05 +0000 (UTC)
Subject: Re: hw/net/cadence_gem: TX checksum offload does not work for
 fragmented packets
To: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 "Peter A. G. Crosthwaite" <peter.crosthwaite@petalogix.com>,
 John Linn <john.linn@xilinx.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <CAEUhbmUuRCDWMKZdgNNX43G4wfLvzgHcMuT=36JO_q8LnAVisg@mail.gmail.com>
 <CAEUhbmXPXT4MRs1bZTMFUWv5Bhe20ZJcO12UUs7Pa4RQBragnA@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <7eb62193-bb90-3b16-a9fa-2937a21ac6f1@redhat.com>
Date: Sun, 26 Apr 2020 15:02:04 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAEUhbmXPXT4MRs1bZTMFUWv5Bhe20ZJcO12UUs7Pa4RQBragnA@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.120; envelope-from=jasowang@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/26 02:29:41
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2020/4/26 =E4=B8=8B=E5=8D=882:57, Bin Meng wrote:
> Hi Jason,
>
> On Tue, Apr 21, 2020 at 10:31 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>> Hi,
>>
>> The cadence_gem does the TX checksum offload by:
>>
>>                  /* Is checksum offload enabled? */
>>                  if (s->regs[GEM_DMACFG] & GEM_DMACFG_TXCSUM_OFFL) {
>>                      net_checksum_calculate(tx_packet, total_bytes);
>>                  }
>>
>> However this will only work for non-fragmented packets. For fragmented
>> packets, it just corrupts the packets by inserting wrong checksum to
>> the fist fragment, or corrupts the data to be sent in other fragments
>> than the first one.
>>
>> Any idea of how to solve this cleanly?
> I suspect this is a common issue for all NIC models in QEMU. Could you
> please comment?
>
> Regards,
> Bin


I think maybe you can have a look at how it was done by e1000e which=20
uses NetTxPkt structure. (E.g net_tx_pkt_update_ip_checksum()).

In the future, we may consider to convert the metadata that just uses=20
NetTxPkt structure, but it's a non-trivial changes.

Thanks


