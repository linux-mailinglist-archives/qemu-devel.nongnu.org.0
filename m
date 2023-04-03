Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB396D4203
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 12:30:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjHRo-0001PG-Jj; Mon, 03 Apr 2023 06:30:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <0102018746aa8382-eabf5475-59a6-4741-a8b1-ca3d5b49da92-000000@eu-west-1.amazonses.com>)
 id 1pjHRl-0001La-P4
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 06:29:57 -0400
Received: from a7-12.smtp-out.eu-west-1.amazonses.com ([54.240.7.12])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_CBC_SHA1:128)
 (Exim 4.90_1) (envelope-from
 <0102018746aa8382-eabf5475-59a6-4741-a8b1-ca3d5b49da92-000000@eu-west-1.amazonses.com>)
 id 1pjHRk-0005f8-4E
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 06:29:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=cphpx6z2rfcgehlykjjh3gknqe3hsoe2; d=ipxe.org; t=1680517792;
 h=Message-ID:Date:MIME-Version:To:Cc:References:From:Subject:In-Reply-To:Content-Type:Content-Transfer-Encoding;
 bh=5ic+QVREy0DDhKmj1uCoGke3+cn0Jbv/DqAKwHZj1Eo=;
 b=d+sInXSpCcQDO6y/CvrxB/RjeEVRydvz9Nn/f71XZBfsFqHNOn4eQ+PJPTjdeC8o
 Hc8aqewd/vnCWnvRVLfsY6BZHPh7C6/brqxW9exxVAb/RBIlGDVd7XxG6bFITklI6IC
 YeG9oHGqZQS1eZjZ8RyRlkyK6Z2RpT8HPKVK3rBciR5CabcgF1jP6kIebAO+7kZ/U6r
 /xE6z2QKYkyns7WvnrwemY+AKrsR1bGBDVc+AZiFSPpcFDZtWCUSCUgTRoY5j42bOuN
 LyPtEJ6oh/gNkuLWboQklQpMai4NAG4DlTjDaLzvCNhFEHEYaQ7TDOIrA+GsxRM+QMr
 pOWRUoL/Og==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=shh3fegwg5fppqsuzphvschd53n6ihuv; d=amazonses.com; t=1680517792;
 h=Message-ID:Date:MIME-Version:To:Cc:References:From:Subject:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
 bh=5ic+QVREy0DDhKmj1uCoGke3+cn0Jbv/DqAKwHZj1Eo=;
 b=QE82+Yyoh6IRzyiC0Vf/bSJaHuY54DjvazNoZDCBwJZOOO3Z0COdeujOt8iPEE6f
 k0gqsUBZlcOdLUQ/K11vvZ5Ojl7kYunoeOpuaVuke8jDyA8OVROtEKS6mzwZl0qkUcU
 OSM9yNlTBUVYIr69+FG5yFyidnVuj3WsWg95hJZg=
Message-ID: <0102018746aa8382-eabf5475-59a6-4741-a8b1-ca3d5b49da92-000000@eu-west-1.amazonses.com>
Date: Mon, 3 Apr 2023 10:29:52 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-US
To: devel@edk2.groups.io, lichao@loongson.cn, maobibo@loongson.cn
Cc: WANG Xuerui <i.qemu@xen0n.name>, qemu-devel <qemu-devel@nongnu.org>,
 Song Gao <gaosong@loongson.cn>, =?UTF-8?B?5p2o5bCP5aif?=
 <yangxiaojuan@loongson.cn>, Gerd Hoffmann <kraxel@redhat.com>
References: <1f1d3d9f-c3df-4f29-df66-886410994cc3@xen0n.name>
 <67517424-0f32-09f8-6446-53f71ebd59b5@loongson.cn>
 <x5vbhjcyc3jl5u3qdjg2dq2znwhdq7ordmbjm6s2hftwyusqp2@r6smasorrjor>
 <317e3008-e2bd-8af6-2cf5-dad49d98cb8d@loongson.cn>
 <acbba848-d770-2d17-f3eb-60b87bfa9447@loongson.cn>
 <aa56f4de-e50e-7a7f-3e0e-39e5fa20df29@loongson.cn>
From: Michael Brown <mcb30@ipxe.org>
Subject: Re: [edk2-devel] On integrating LoongArch EDK2 firmware into QEMU
 build process
In-Reply-To: <aa56f4de-e50e-7a7f-3e0e-39e5fa20df29@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Feedback-ID: 1.eu-west-1.fspj4M/5bzJ9NLRzJP0PaxRwxrpZqiDQJ1IF94CF2TA=:AmazonSES
X-SES-Outgoing: 2023.04.03-54.240.7.12
Received-SPF: pass client-ip=54.240.7.12;
 envelope-from=0102018746aa8382-eabf5475-59a6-4741-a8b1-ca3d5b49da92-000000@eu-west-1.amazonses.com;
 helo=a7-12.smtp-out.eu-west-1.amazonses.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FORGED_MUA_MOZILLA=2.309, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 NICE_REPLY_A=-2.37, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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

On 03/04/2023 11:13, Chao Li wrote:
> This problem is because the gcc-12 does not yet to support the option 
> 'mno-explicit-reloc', this option is used to open the new reloaction 
> type for LoongArch, this new feature is very important for LoongArch, 
> because it can reduce the binary size and improve code execution 
> efficiency, so we turn it on when submitting the code to the EDK2 repo.

Is it possible to produce a _functional_ LoongArch64 EDK2 binary without 
this option, even if the resulting binary is less efficient?

(I'm the person who updated Fedora's binutils and cross-gcc packages to 
ensure that LoongArch64 was supported in Fedora 38, and this 
-mno-explicit-relocs issue is also currently blocking me from merging 
LoongArch64 support into iPXE.)

Thanks,

Michael


