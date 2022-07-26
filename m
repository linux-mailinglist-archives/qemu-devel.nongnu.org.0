Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E814580E55
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 09:58:09 +0200 (CEST)
Received: from localhost ([::1]:44120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGFSB-0007n8-MN
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 03:58:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fanjinhao21s@ict.ac.cn>)
 id 1oGFPu-0006Dr-At
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 03:55:46 -0400
Received: from smtp21.cstnet.cn ([159.226.251.21]:36772 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fanjinhao21s@ict.ac.cn>) id 1oGFPr-0001KA-81
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 03:55:46 -0400
Received: from smtpclient.apple (unknown [159.226.43.13])
 by APP-01 (Coremail) with SMTP id qwCowACHaVrynd9ifIt5Ag--.37610S2;
 Tue, 26 Jul 2022 15:55:31 +0800 (CST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH v4] hw/nvme: Use ioeventfd to handle doorbell updates
From: Jinhao Fan <fanjinhao21s@ict.ac.cn>
In-Reply-To: <Yt+avxgBxcwrxYgi@apples>
Date: Tue, 26 Jul 2022 15:55:30 +0800
Cc: qemu-devel@nongnu.org,
 kbusch@kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <869047CA-DD0A-45D1-9DBA-2BA1A3E00ADF@ict.ac.cn>
References: <20220705142403.101539-1-fanjinhao21s@ict.ac.cn>
 <Yt8DWWg8qPLxL0fk@apples> <D12147BE-7F7A-4F41-9317-765F7EB2E971@ict.ac.cn>
 <Yt+avxgBxcwrxYgi@apples>
To: Klaus Jensen <its@irrelevant.dk>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-CM-TRANSID: qwCowACHaVrynd9ifIt5Ag--.37610S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Gw4xXF4xJr4fZrWrXw15CFg_yoWfArX_ur
 109r1DCw48JryjkrWDGFn8ZFn7ta98Xry5Xr1DXw18ua45Xr9xCFsYgFnavw17Ars2qry3
 CwnrtFsI9F909jkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUb2xYjsxI4VWkCwAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I
 6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
 8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0
 cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4
 A2jsIEc7CjxVAFwI0_Cr1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
 64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8Jw
 Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc2xSY4AK67AK6r4xMxAIw28I
 cxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2
 IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUXVWUAwCIc40Y0x0EwIxGrwCI
 42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42
 IY6xAIw20EY4v20xvaj40_Wr1j6rW3Jr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2
 z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU2NeODUUUU
X-Originating-IP: [159.226.43.13]
X-CM-SenderInfo: xidqyxpqkd0j0rv6xunwoduhdfq/
Received-SPF: pass client-ip=159.226.251.21;
 envelope-from=fanjinhao21s@ict.ac.cn; helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

at 3:41 PM, Klaus Jensen <its@irrelevant.dk> wrote:

> On Jul 26 15:35, Jinhao Fan wrote:
>> at 4:55 AM, Klaus Jensen <its@irrelevant.dk> wrote:
>>=20
>>> We have a regression following this patch that we need to address.
>>>=20
>>> With this patch, issuing a reset on the device (`nvme reset =
/dev/nvme0`
>>> will do the trick) causes QEMU to hog my host cpu at 100%.
>>>=20
>>> I'm still not sure what causes this. The trace output is a bit
>>> inconclusive still.
>>>=20
>>> I'll keep looking into it.
>>=20
>> I cannot reproduce this bug. I just start the VM and used `nvme reset
>> /dev/nvme0`. Did you do anything before the reset?
>=20
> Interesting and thanks for checking! Looks like a kernel issue then!
>=20
> I remember that I'm using a dev branch (nvme-v5.20) of the kernel and
> reverting to a stock OS kernel did not produce the bug.

I=E2=80=99m using 5.19-rc4 which I pulled from linux-next on Jul 1. It =
works ok on
my machine.=


