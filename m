Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5126A83B7
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 14:43:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXjCr-0004ae-SO; Thu, 02 Mar 2023 08:42:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pXjCj-0004Xq-Li
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 08:42:41 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pXjCY-0004Sk-S5
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 08:42:32 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id A86407462DB;
 Thu,  2 Mar 2023 14:42:17 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 79E2C7457E7; Thu,  2 Mar 2023 14:42:17 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 7850A745706;
 Thu,  2 Mar 2023 14:42:17 +0100 (CET)
Date: Thu, 2 Mar 2023 14:42:17 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Paolo Bonzini <pbonzini@redhat.com>
cc: "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH] hw/acpi: Set memory regions to native endian as a work
 around
In-Reply-To: <c465a44a-1ff6-5118-516c-56a8f99b9509@redhat.com>
Message-ID: <485be109-57a5-178a-1ac6-291fd05d9baa@eik.bme.hu>
References: <20211108130934.59B48748F52@zero.eik.bme.hu>
 <b0787bca-8321-059e-d360-1e0a0af31228@redhat.com>
 <a7992420-e2e3-7859-b2de-f9aa88c94945@redhat.com>
 <d03380e9-b6a2-5998-cc72-6443cfdc46b5@eik.bme.hu>
 <d9fcba9d-c2c6-5be3-ce5f-baf5a116bbc4@eik.bme.hu>
 <20220119041842-mutt-send-email-mst@kernel.org>
 <20220222094021-mutt-send-email-mst@kernel.org>
 <f9f183c4-b0b8-22c6-57f9-1b6b20e8e5a5@eik.bme.hu>
 <20230220172659-mutt-send-email-mst@kernel.org>
 <f4e755b6-051e-103f-b8bc-2765d277633f@eik.bme.hu>
 <e3a19d91-b9ef-9352-8f60-35432fdf5d1e@redhat.com>
 <c2bdd618-5077-3b3f-12d0-974cf9757692@eik.bme.hu>
 <c465a44a-1ff6-5118-516c-56a8f99b9509@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Tue, 21 Feb 2023, Paolo Bonzini wrote:
> On 2/21/23 13:48, BALATON Zoltan wrote:
>> My patch works and don't see what else could it break.
>
> I strongly suspect that your patch, while fixing access to one byte of the 
> (2-byte) registers, breaks access to the other byte.
>
> Thanks for the reproduction instructions, I'll take a look.

Any chance this can still be fixed? As a bugfix we may have one more week 
maybe.

Regards,
BALATON Zoltan

