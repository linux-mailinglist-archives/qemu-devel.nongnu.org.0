Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B083D48B2CC
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 18:03:44 +0100 (CET)
Received: from localhost ([::1]:54256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7KYh-0004O9-07
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 12:03:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mirela.grujic@greensocs.com>)
 id 1n7KQ7-0001MR-VZ
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 11:54:51 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:41766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mirela.grujic@greensocs.com>)
 id 1n7KQ5-0004Zm-98
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 11:54:51 -0500
Received: from [192.168.1.102] (cable-24-135-22-90.dynamic.sbb.rs
 [24.135.22.90])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 8F75221C39;
 Tue, 11 Jan 2022 16:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1641920082;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=igRWvOH+F/pdtsHEcxszO3AlIm6z5p/T7+zYLmm4JvA=;
 b=M6mL75t4FKU19tBvjFIH3hBrmsjYXfwjCVcaoFENqQFFmMrADEt1Wl9tM5Qhd4iTO+rpY8
 09/2v48YDodncE7WzGtB/z1dICu/qjJ0r8PRRK/WLUpgzG7Sjy93UWu23SjN+oRo4oa719
 wjqs5ZXrnoAanKChRWkFGyw4+QCETiA=
To: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
From: Mirela Grujic <mirela.grujic@greensocs.com>
Subject: RFC: QMP configuration - allocating/setting qdev array properties?
Message-ID: <cccba1ec-34c7-73da-1100-416a0afa8cea@greensocs.com>
Date: Tue, 11 Jan 2022 17:54:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=mirela.grujic@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>,
 Damien Hedde <damien.hedde@greensocs.com>, jsnow@redhat.com,
 Mark Burton <mark.burton@greensocs.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,


While working on a prototype and configuring a whole machine using QMP 
we run into the following scenario.


Some device models use array properties. The array is allocated when 
len-<arrayname> property is set, then, individual elements of the array 
can be set as any other property (see description above the 
DEFINE_PROP_ARRAY definition in qdev-properties.h for more details). We 
need to do both (allocate the array and set its elements) before the 
device can be realized. Attempting to set len-<arrayname> and array 
elements in a single device_add command does not work because the order 
of setting properties is not guaranteed, i.e. we're likely attempting to 
set an element of the array that's not yet allocated.

Allowing the device initialize and realize phases to be split would 
solve this problem. For example, the device_add would be issued with 
'realized=false', we can set the len-<arrayname> in the same device_add 
command or a following qom-set command, then we would use a sequence of 
qom-set commands to set array elements, and at the end, we would realize 
the device by issuing qom-set path=<device_id> property=realized 
value=true. This is what we currently do in our prototype.

Another situation where we found that splitting initialize and realize 
phases would solve a problem has been presented here: 
https://lists.gnu.org/archive/html/qemu-devel/2021-06/msg07272.html


We would appreciate your feedback, any other proposals for solving both 
problems are welcome.


Thanks,

Mirela



