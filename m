Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 805E65F7C56
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 19:36:34 +0200 (CEST)
Received: from localhost ([::1]:41376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogrGz-00032b-47
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 13:36:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dave@stgolabs.net>) id 1ogrCM-0000Up-LA
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 13:31:46 -0400
Received: from dog.birch.relay.mailchannels.net ([23.83.209.48]:46937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dave@stgolabs.net>) id 1ogrCJ-0001ij-8Q
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 13:31:46 -0400
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
 by relay.mailchannels.net (Postfix) with ESMTP id 1D13F3C2496;
 Fri,  7 Oct 2022 17:31:29 +0000 (UTC)
Received: from pdx1-sub0-mail-a245 (unknown [127.0.0.6])
 (Authenticated sender: dreamhost)
 by relay.mailchannels.net (Postfix) with ESMTPA id DF90A3C19CC;
 Fri,  7 Oct 2022 17:31:19 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1665163880; a=rsa-sha256;
 cv=none;
 b=I08AjRYgKyrYQ4bmcJ9VPP4XIN6YYdL0Q80OofyBN3edHO9obPAfcvhCfGJsuI2cnXeeW8
 0Li/vv6+hTxvYdw4rCZ6v309rPpZxPSd77qXOoiK+UbWxJrQST0IHAtz3eT5EsHHv7VxmM
 Y+Q58gOaAUny7k7zancYpF+cDOPAxO3s78GJmF+UrZrSjXFIgOfuCsCq4oNUESicgV0xMk
 wWAd8GzgW5hs7lcqowgromQG118OKg7HugVMoq+lEjlFvOYa8G4qH1c2fD7GiVJ7X6m0Ad
 C04E2ng8slyh7hKC6uY77aTHYOsZzB8NDvjXy5gCtT1ohVIL9EdaLXPFe6PC3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net; s=arc-2022; t=1665163880;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:dkim-signature;
 bh=M1VoNPvm8hDyM6i1JILLwiOmB5q/v5oDv1dyE4h86VA=;
 b=1DJOArHnHC0hboqOVmUti4GcOPw3hmQRsjso3KHAIWqEBArT9S9ylx/YXpWLQtnur7/xen
 fUzMBQbypODmm5tgr5XjRr/grnG/d8r8daILHS4pvuGE5DgoczChg0DPNRv5OA5IN2yiIm
 G8BMZMacSdmjcEJpwFx368bEoIokgxKRtooyNpF0dMwMffiegfwkplMYtrp9R3XxLB1AhH
 L1CM/FhX+nYoFtqlyAzPn0vH0lQw/nVkEfKarkqC0cLq7uya1EP0SxW9vM7Mu5NhUc246t
 wv1m7S83QVPGyIO1WUhY0qZJfhZ98bFS4OMB0BhNEBrxh2NioA9oNdBrkMi4jA==
ARC-Authentication-Results: i=1; rspamd-7c485dd8cf-5v8k9;
 auth=pass smtp.auth=dreamhost smtp.mailfrom=dave@stgolabs.net
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|dave@stgolabs.net
X-MailChannels-Auth-Id: dreamhost
X-Illustrious-Decisive: 28f7c89a2fc2abcb_1665163880328_1267753359
X-MC-Loop-Signature: 1665163880327:2627510934
X-MC-Ingress-Time: 1665163880327
Received: from pdx1-sub0-mail-a245 (pop.dreamhost.com [64.90.62.162])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
 by 100.116.63.144 (trex/6.7.1); Fri, 07 Oct 2022 17:31:20 +0000
Received: from offworld (ip72-199-50-187.sd.sd.cox.net [72.199.50.187])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: dave@stgolabs.net)
 by pdx1-sub0-mail-a245 (Postfix) with ESMTPSA id 4Mkb2F1S4mz88;
 Fri,  7 Oct 2022 10:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stgolabs.net;
 s=dreamhost; t=1665163877;
 bh=M1VoNPvm8hDyM6i1JILLwiOmB5q/v5oDv1dyE4h86VA=;
 h=Date:From:To:Cc:Subject:Content-Type;
 b=L7RYe4oMkAoE4CB7QUIwc8VSNOWU1YWp5I+Aqh9oMaBMeC06T8q/j4e/oY77b78mm
 smT4hws7O/LDBazQfbvm1beKnYthghqLygjVASrF7EYgSC2gdPMPsP5+FV9p4DrI/Z
 wQNMi5l6yUhmlQWDy4A7cM4UdZ8yw1iU+5zSKzKvKEWa9a7qJNU11ciHw7zAMFFE9o
 JNJ9FkUDmX2BXbLn1NaILSaVPw9b29CDtv4EL+Pp4pybEi43mmgflLuNNQoGKGfMpa
 GBg8TQqLXgPK5ZYEG+Bt4ouiGGaB5xjZVU3yMXc7q63ta0KMRuJzdjKKvOPBNNiQFK
 XaVsuiOWm0aXA==
Date: Fri, 7 Oct 2022 10:10:43 -0700
From: Davidlohr Bueso <dave@stgolabs.net>
To: Gregory Price <gourry.memverge@gmail.com>
Cc: qemu-devel@nongnu.org, jonathan.cameron@huawei.com,
 linux-cxl@vger.kernel.org, alison.schofield@intel.com,
 a.manzanares@samsung.com, bwidawsk@kernel.org,
 Gregory Price <gregory.price@memverge.com>
Subject: Re: [PATCH 1/2] hw/cxl: set cxl-type3 device type to
 PCI_CLASS_MEMORY_CXL
Message-ID: <20221007171043.kpo4q4zc7xy7pvwf@offworld>
References: <20221006233702.18532-1-gregory.price@memverge.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20221006233702.18532-1-gregory.price@memverge.com>
User-Agent: NeoMutt/20220429
Received-SPF: pass client-ip=23.83.209.48; envelope-from=dave@stgolabs.net;
 helo=dog.birch.relay.mailchannels.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 06 Oct 2022, Gregory Price wrote:

>Current code sets to STORAGE_EXPRESS and then overrides it.

Good catch.

Reviewed-by: Davidlohr Bueso <dave@stgolabs.net>

