Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01820FC31F
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Nov 2019 10:56:40 +0100 (CET)
Received: from localhost ([::1]:54994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iVBri-0000nG-T8
	for lists+qemu-devel@lfdr.de; Thu, 14 Nov 2019 04:56:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37582)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1iVBiN-0008Fj-Nc
 for qemu-devel@nongnu.org; Thu, 14 Nov 2019 04:47:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1iVBiL-0004wq-Ml
 for qemu-devel@nongnu.org; Thu, 14 Nov 2019 04:46:59 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:51236
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1iVBiJ-0004tP-Ly
 for qemu-devel@nongnu.org; Thu, 14 Nov 2019 04:46:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573724811;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TDSS8ua/TgCy32Sz0kfYkQPcEygfV8A+qiGucESwXpY=;
 b=EVBij4xrtYRnpLvkovtirC69oxa3JvHACVedTbmlsVrZgasndyEjv097dCLb7gz3riqYaa
 TPNjemcnwwe6gjzCXSbj3NHqTuXgR1A6dPaNqquDvw2OHFa/7lZsehKwe59r9ZhxRMVm7f
 f/S6M+dCy+OFN33/yiivGk3GjLLsBPE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-388-pNT_aV1jM0SkIldBXJonFA-1; Thu, 14 Nov 2019 04:46:50 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4185D10B7BF2
 for <qemu-devel@nongnu.org>; Thu, 14 Nov 2019 09:46:49 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-89.ams2.redhat.com
 [10.36.116.89])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6CBC95F761;
 Thu, 14 Nov 2019 09:46:48 +0000 (UTC)
Subject: Re: [PATCH 01/16] memory: do not look at current_machine->accel
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <1573655945-14912-1-git-send-email-pbonzini@redhat.com>
 <1573655945-14912-2-git-send-email-pbonzini@redhat.com>
 <2db4f901-65ad-4b80-d309-b8b63330492f@redhat.com>
 <4783e606-19b8-c3c0-08ab-ac84b02af6f4@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <8ec2d398-3cfb-5c55-42e0-a437ec519ede@redhat.com>
Date: Thu, 14 Nov 2019 10:46:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <4783e606-19b8-c3c0-08ab-ac84b02af6f4@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: pNT_aV1jM0SkIldBXJonFA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/11/2019 10.35, Paolo Bonzini wrote:
> On 14/11/19 10:10, Thomas Huth wrote:
>>> "info mtree" prints the wrong accelerator name if used with for example
>>> "-machine accel=3Dkvm:tcg".
>> I had a quick look at the output of "info mtree" with and without
>> "accel=3Dkvm:tcg", but I could not spot any obvious places where it's
>> wrong. Could you give an example?
>=20
> Indeed the commit message should say "info mtree -f".

Right, with "-f" it is obvious. When you added that to the commit
message, feel free to add my:

Tested-by: Thomas Huth <thuth@redhat.com>


