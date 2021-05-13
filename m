Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E0137FB0B
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 17:51:16 +0200 (CEST)
Received: from localhost ([::1]:51930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhDcJ-0005rB-0r
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 11:51:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lhDae-0004tJ-O1; Thu, 13 May 2021 11:49:32 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:57471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lhDad-0005Oq-16; Thu, 13 May 2021 11:49:32 -0400
Received: from [192.168.100.1] ([82.142.31.78]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1M8QJq-1lcpsM2dAO-004QKa; Thu, 13 May 2021 17:49:26 +0200
Subject: Re: [PATCH] virtiofsd: Fix check of chown()'s return value
To: Greg Kurz <groug@kaod.org>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <162040394890.714971.15502455176528384778.stgit@bahia.lan>
 <YJlAN+eLMASsJxsL@work-vm> <20210510162300.546af5cb@bahia.lan>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <23077843-5898-6e6e-d974-aa69fa83a90a@vivier.eu>
Date: Thu, 13 May 2021 17:49:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210510162300.546af5cb@bahia.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:l8oG2wN4Bp1mOSOjkVxTFoRrLpYjNtdRlAwjYnqgygMn8Ab+5di
 afVjhOvWod5GAr41/f7ppkOf2szf+XeV7OdcYHcQO1ui4r10pdboR/JeBpk6BlYQ3wSOHuC
 +UNRUg5NhgRZYe0qK1D880fE7evzHlvWy7dukZ2r+a6iK9CPPg5SYZj20GvegsMD/6zp/E2
 pUE9p6xX9E+JRlgvYbbyA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ClUmrtK2gDE=:87uAxAMd08NzdPhBFH7+vn
 fzf5nvXiCWKRCjMWq4vU5M2m8aLqMxp5DKeuPvCtypdJUOlkxKGJdvvBEwmcjj0QsylOU66PW
 xuqedXLFH6682VxHIcGc4p45c5A5JjK+R8nu/extFlcN5XuVyBecYwJeEKWbjbmJHbK7YiQzO
 pae3lsR/SIb57MoKSW6y3DJYkjF3Gt1bB8GDbKSBHgWpTc6ncj9NZlNq48NGfaxydZSJWLr8T
 a8WeLAmB1hiPPuCljLyxEgs+a2Ke1BaHBXBHdyiJM92x2jfUcRuzYO3U6EhgeJuTxZkHC9pcQ
 6TnkhUO0qxV/vP/MnYPHpeMZNfWa+FdF4OKaYbIDs4vRT6NJrpi+s6TQKJ7Rh0N99MGsiRuM7
 Crhqqdrr3h5w20T2CTgdtbpmpSqnTUOXSjHMKUeZlhlb+Rn2oAgq3MlxU2+yvSuQC03KozlyQ
 TeWYCc7DAKrB5ElcSEEywKk44tJ3jwAhvm4ojbJZDcjHVk7R2EpIHCYVSpGUFx49jJ46wB5Al
 XhJYgacgjQHB9oG0HMkEXI=
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 10/05/2021 à 16:23, Greg Kurz a écrit :
> On Mon, 10 May 2021 15:16:23 +0100
> "Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
> 
>> * Greg Kurz (groug@kaod.org) wrote:
>>> Otherwise you always get this warning when using --socket-group=users
>>>
>>>  vhost socket failed to set group to users (100)
>>>
>>> While here, print out the error if chown() fails.
>>>
>>> Signed-off-by: Greg Kurz <groug@kaod.org>
>>
>> probably needs a fixes:  but yes.
>>
> 
> Fixes: f6698f2b03b0 ("tools/virtiofsd: add support for --socket-group")
> 

Applied to my trivial-patches branch.

Thanks,
Laurent


