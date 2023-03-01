Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 943F36A6999
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 10:14:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXIWT-00081I-05; Wed, 01 Mar 2023 04:13:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pXIWR-00080o-7T
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 04:13:15 -0500
Received: from smtpout2.mo529.mail-out.ovh.net ([79.137.123.220])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pXIWP-0004kj-7q
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 04:13:14 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.89])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 0F50821061;
 Wed,  1 Mar 2023 09:13:01 +0000 (UTC)
Received: from kaod.org (37.59.142.97) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Wed, 1 Mar
 2023 10:13:00 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G002081ea010-eb63-43a5-87a7-bb51fd4b7217,
 BA6511934B6943C3167A88A21852BB5F3FADB7F3) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <d57cabeb-192a-e56e-7eac-c8d5634368bc@kaod.org>
Date: Wed, 1 Mar 2023 10:12:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v6 0/8] net: Pad short frames for network backends
Content-Language: en-US
To: <bmeng.cn@gmail.com>, Jason Wang <jasowang@redhat.com>,
 <qemu-devel@nongnu.org>
CC: Bin Meng <bmeng@tinylab.org>, Dmitry Fleytman <dmitry.fleytman@gmail.com>, 
 Helge Deller <deller@gmx.de>, Richard Henderson
 <richard.henderson@linaro.org>
References: <20230301090203.1601925-1-bmeng.cn@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20230301090203.1601925-1-bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG4EX2.mxp5.local (172.16.2.32) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 1185deec-1c0e-405c-ae2e-94cb2517a8f5
X-Ovh-Tracer-Id: 1665205965233752937
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrudelgedguddvfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepkefhvefhheeiffduvefhfeeitefhleevudfgkedujeduieetfeffgfffvdelueelnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddrleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopegsmhgvnhhgrdgtnhesghhmrghilhdrtghomhdpjhgrshhofigrnhhgsehrvgguhhgrthdrtghomhdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpsghmvghnghesthhinhihlhgrsgdrohhrghdpughmihhtrhihrdhflhgvhihtmhgrnhesghhmrghilhdrtghomhdpuggvlhhlvghrsehgmhigrdguvgdprhhitghhrghrugdrhhgvnhguvghrshhonheslhhinhgrrhhordhorhhgpdfovfetjfhoshhtpehmohehvdelpd
 hmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout2.mo529.mail-out.ovh.net
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.092,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Hello Bin,

On 3/1/23 10:01, bmeng.cn@gmail.com wrote:
> From: Bin Meng <bmeng@tinylab.org>
> 
> The minimum Ethernet frame length is 60 bytes. For short frames with
> smaller length like ARP packets (only 42 bytes), on a real world NIC
> it can choose either padding its length to the minimum required 60
> bytes, or sending it out directly to the wire. Such behavior can be
> hardcoded or controled by a register bit. Similarly on the receive
> path, NICs can choose either dropping such short frames directly or
> handing them over to software to handle.
> 
> On the other hand, for the network backends like SLiRP/TAP, they
> don't expose a way to control the short frame behavior. As of today
> they just send/receive data from/to the other end connected to them,
> which means any sized packet is acceptable. So they can send and
> receive short frames without any problem. It is observed that ARP
> packets sent from SLiRP/TAP are 42 bytes, and SLiRP/TAP just send
> these ARP packets to the other end which might be a NIC model that
> does not allow short frames to pass through.
> 
> To provide better compatibility, for packets sent from QEMU network
> backends like SLiRP/TAP, we change to pad short frames before sending
> it out to the other end, if the other end does not forbid it via the
> nc->do_not_pad flag. This ensures a backend as an Ethernet sender
> does not violate the spec. But with this change, the behavior of
> dropping short frames from SLiRP/TAP interfaces in the NIC model
> cannot be emulated because it always receives a packet that is spec
> complaint. The capability of sending short frames from NIC models is
> still supported and short frames can still pass through SLiRP/TAP.
> 
> This series should be able to fix the issue as reported with some
> NIC models before, that ARP requests get dropped, preventing the
> guest from becoming visible on the network. It was workarounded in
> these NIC models on the receive path, that when a short frame is
> received, it is padded up to 60 bytes.

I guess we can drop this code in ftgmac100.c also then :

     /* TODO : Pad to minimum Ethernet frame length */
     /* handle small packets.  */
     if (size < 10) {
         qemu_log_mask(LOG_GUEST_ERROR, "%s: dropped frame of %zd bytes\n",
                       __func__, size);
         return size;
     }

Correct ? No need to resend. I can take care of it.

Thanks,

C.

> Note this is a resend of the v5 [1]. Only the first 4 patches were
> applied in QEMU 6.0, and the reset was said to be queued for 6.1
> but for some reason they never landed in QEMU mainline.
> 
> [1] https://lore.kernel.org/qemu-devel/859cd26a-feb2-ed62-98d5-764841a468cf@redhat.com/
> 
> Bin Meng (8):
>    hw/net: e1000: Remove the logic of padding short frames in the receive
>      path
>    hw/net: vmxnet3: Remove the logic of padding short frames in the
>      receive path
>    hw/net: i82596: Remove the logic of padding short frames in the
>      receive path
>    hw/net: ne2000: Remove the logic of padding short frames in the
>      receive path
>    hw/net: pcnet: Remove the logic of padding short frames in the receive
>      path
>    hw/net: rtl8139: Remove the logic of padding short frames in the
>      receive path
>    hw/net: sungem: Remove the logic of padding short frames in the
>      receive path
>    hw/net: sunhme: Remove the logic of padding short frames in the
>      receive path
> 
>   hw/net/e1000.c   | 11 +----------
>   hw/net/i82596.c  | 18 ------------------
>   hw/net/ne2000.c  | 12 ------------
>   hw/net/pcnet.c   |  9 ---------
>   hw/net/rtl8139.c | 12 ------------
>   hw/net/sungem.c  | 14 --------------
>   hw/net/sunhme.c  | 11 -----------
>   hw/net/vmxnet3.c | 10 ----------
>   8 files changed, 1 insertion(+), 96 deletions(-)
> 


