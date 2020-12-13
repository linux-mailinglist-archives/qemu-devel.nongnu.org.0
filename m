Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A48D2D8F29
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Dec 2020 18:50:01 +0100 (CET)
Received: from localhost ([::1]:36452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koVVQ-0008G4-AG
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 12:50:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1koVQm-00042t-Aa; Sun, 13 Dec 2020 12:45:12 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:60945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1koVQk-00041X-8G; Sun, 13 Dec 2020 12:45:12 -0500
Received: from [192.168.100.1] ([82.252.135.218]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MqsGv-1kK8Yh3WgT-00msST; Sun, 13 Dec 2020 18:44:55 +0100
Subject: Re: [PATCH RESEND v2 4/7] elf2dmp/pdb: Plug memleak in
 pdb_init_from_file
To: Chen Qun <kuhn.chenqun@huawei.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
References: <20201023061218.2080844-1-kuhn.chenqun@huawei.com>
 <20201023061218.2080844-5-kuhn.chenqun@huawei.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <a6fef728-139b-c7a7-0717-e1bd7661665e@vivier.eu>
Date: Sun, 13 Dec 2020 18:44:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201023061218.2080844-5-kuhn.chenqun@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:MDK2GPRf5C/u2kd++9fWXvMKYrKZDXZR9X5ZnEL3B0wc78qIDb4
 UbTdUYYa6hdnA5mHlRi1RmSIUiQFMyB9AS0Yp8Vr6p6NIdTcLX0QXngufmMieLx4ly9VWPF
 Pj/F9QTRP7i61DdiHfHzhcqFNs7ro7l8+rFRNPfb9GmRzfphPfsA/Y8xTNrKm4MdVs4wDQB
 qhsehrJn2GFChFK9tax6A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:avSQKv66Vhc=:Pnniahf9Z1nM6Izflrh5se
 JJssaQuXC5ltJ1RzgB7aay9XCqQmxJ0u5lydC+hZ0wbFUjJn7yd4ifwMEN5NHmPaj87UE80Sa
 bRQmD5TE7LjzC/ZSk6OBfe7I2jmkk2BLTs9RmLDmQoAWYGxiIp15qABD6oRxeqf9HVhNSMzUm
 HLTEUjj6QeVPbTMuMMzV7Jk8G0IpaZZiJ+Y4vzclX51JVNQ0reai6O2Dq1Rf7zll6HhGFdep7
 KPI5hzxGR954cB6gTeBD7+xQ3+0bdxgCRHsJl2j2wb6IRduzps6WlpSTrC/SUmGb7OEmyRtsy
 BNfInCA5aPmGM0nMKPhWMPlr7wK9pt2t+Ma2MNUsyOkXuhSbeyY0ZjLVyB14Y9RX0B4uFcx1L
 Ejru47fwJNBQZuvc3seQvB+gq3ndJGlKOvE9cC4b2DAA12zKW4nCUu5xnljiZkhcD/4a+ioal
 HvaKTaNrlQ==
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: lvivier@redhat.com, zhang.zhanghailiang@huawei.com,
 Viktor Prutyanov <viktor.prutyanov@phystech.edu>, Li Qiang <liq3ea@gmail.com>,
 pannengyuan@huawei.com, ganqixin@huawei.com,
 Euler Robot <euler.robot@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 23/10/2020 à 08:12, Chen Qun a écrit :
> From: Pan Nengyuan <pannengyuan@huawei.com>
> 
> Missing g_error_free in pdb_init_from_file() error path. Fix that.
> 
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
> Reviewed-by: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
> Reviewed-by: Li Qiang <liq3ea@gmail.com>
> Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
> ---
>  contrib/elf2dmp/pdb.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/contrib/elf2dmp/pdb.c b/contrib/elf2dmp/pdb.c
> index a5bd40c99d..b3a6547068 100644
> --- a/contrib/elf2dmp/pdb.c
> +++ b/contrib/elf2dmp/pdb.c
> @@ -285,6 +285,7 @@ int pdb_init_from_file(const char *name, struct pdb_reader *reader)
>      reader->gmf = g_mapped_file_new(name, TRUE, &gerr);
>      if (gerr) {
>          eprintf("Failed to map PDB file \'%s\'\n", name);
> +        g_error_free(gerr);
>          return 1;
>      }
>  
> 

Applied to my trivial-patches branch.

Thanks,
Laurent


