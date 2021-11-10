Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EBAE44BEB2
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 11:31:05 +0100 (CET)
Received: from localhost ([::1]:48742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkksi-00036Z-OP
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 05:31:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mkkmI-0002hO-2E
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 05:24:26 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:55599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mkkmF-0005F6-04
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 05:24:25 -0500
Received: from [192.168.100.1] ([82.142.14.190]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MnWx3-1mL4TU3nrZ-00jc9w; Wed, 10 Nov 2021 11:24:10 +0100
Message-ID: <a427f926-1f0a-c7da-7439-0120c49dbd7d@vivier.eu>
Date: Wed, 10 Nov 2021 11:24:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 0/4] linux-user: Fix getdents alignment issues (#704)
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211107124845.1174791-1-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20211107124845.1174791-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:zESrOBZV2SzLKfEYUSCjgUC7INVvryREn+nAWU3PefGXOuhAW6i
 rej16B+Oqy8lLI2pCmNyweseZpwujzUL5i09nCe5YsCZWK0ONl6yNXaNyyrIbr3UoZPYOYI
 6RWyhmLTFi8o9RojzDz1kCIHd5VwbaB0A818WngMLixMAN6CJ9nLaF6kifs/4XIAT7x1OFD
 q8mKIYYCvVJDzo9xiZdDQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:AmzydlBJta0=:s1gdB78bgZQgETOl1lI3Ma
 TbOPLt+O1ou/OchLER5YBHvh8rh3T0uX3uLnFq0XQudrSpLOT/i5mhFsOvQeVx5QI2amiq64l
 mpaAbO5j5FOuJEKMqswgXa6YmslIOAAQYSCtZmrGdrGaT8nLxGFbsyz/TFcdtviR1p5Q3O2QM
 BZo7yiqTDmTaqUeoNkeXFhYg89XIq253rTtkXtA8Mmg2v3B9KwJT+IpkcnTvM3yxYPSLKPwuf
 ICU4xkTFQkvgk3tDmlRgL2vDPKDlzUmfw97yiw4gL6RbCKvTXrCdD4usyQE0eCq4ePr5jcOKw
 sZwqGZy28yO+y9ancpwoR5wzQvmWGGuXv10VLywOfcGdBpc3ityd01kbAdE338/kdR61k5HNP
 YOKvokdPgcYJ+l1sMBkPgE1vdASPFloQiQPPqFIiVwV/50SN4jiHHHvxCQp5gZAzb1LMalRQX
 GEjyNpmTZAmpJSVUxTciIgdd/fcKrfoj+n2r0vNdqh//Sw4rPHUalxnpaLagB7vDAoh7rlrAK
 2etk0E85m2K405RyhUqyswhXz2u2wRkWNEPIqnFuFXl/LlEWyH+aiMicalQKrkehCeo3EhiWG
 pnxkaGL3v6ijpl0+wxdk4WQXIoT/vZ0R1yBqVHjBclnWvmqorQQNSe4++LMyPc1OvZoFKCsqb
 JhaiDngczXG+8WKSEVMPiOKsd7vF9z8LwqFQ2BkfrhuXhtac7PYGg6kBWHxThWx9286E=
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.678,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 07/11/2021 à 13:48, Richard Henderson a écrit :
> There are a number of alignement issues flagged up by clang,
> this attempts to fix only one of them: getdents.
> 
> r~
> 
> Richard Henderson (4):
>    linux-user: Split out do_getdents, do_getdents64
>    linux-user: Always use flexible arrays for dirent d_name
>    linux-user: Fix member types of target_dirent64
>    linux-user: Rewrite do_getdents, do_getdents64
> 
>   linux-user/syscall_defs.h |  12 +-
>   linux-user/syscall.c      | 290 ++++++++++++++++++--------------------
>   2 files changed, 141 insertions(+), 161 deletions(-)
> 

Series applied to my linux-user-for-6.2 branch.

Thanks,
Laurent

