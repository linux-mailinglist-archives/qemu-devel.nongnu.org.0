Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B36903B2297
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 23:39:17 +0200 (CEST)
Received: from localhost ([::1]:39408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwAaa-0006hI-81
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 17:39:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1lwAZg-000613-VU
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 17:38:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1lwAZe-0000el-8V
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 17:38:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624484297;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tvg4JL832OTh+3ZOYBqUDeHScI1rEgiHJzvtg7t5i0M=;
 b=O6VtFl2Razj6LjWD3DIkTVAd9UG9dp9cMN+dZAWqw2aNpPyXLXp/nQBVxFRYiBaw2VJkbf
 pr+vjIygvRojm/4q8ypjM1FgPsb5Mh7Q5+b0XoNpoXHV1ThZzgWey3IRu8/sOyY9+6xRkT
 pGZeHXk4r0er1/R/HZ6+SuYIKMEMBIw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-456-ixXpauJwNviEStpk27MkEQ-1; Wed, 23 Jun 2021 17:38:15 -0400
X-MC-Unique: ixXpauJwNviEStpk27MkEQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5D63910C1ADC;
 Wed, 23 Jun 2021 21:38:14 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-112-37.ams2.redhat.com
 [10.36.112.37])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1E2975D9C6;
 Wed, 23 Jun 2021 21:37:55 +0000 (UTC)
Subject: Re: [PATCH v2 00/23] target/i386/sev: Housekeeping (OVMF +
 SEV-disabled binaries)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210616204328.2611406-1-philmd@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <52730723-1320-87d3-a241-731f3f0ba3aa@redhat.com>
Date: Wed, 23 Jun 2021 23:37:54 +0200
MIME-Version: 1.0
In-Reply-To: <20210616204328.2611406-1-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Brijesh Singh <brijesh.singh@amd.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Connor Kuehl <ckuehl@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Dov Murik <dovmurik@linux.ibm.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06/16/21 22:43, Philippe Mathieu-Daudé wrote:
> Special comment for Laszlo: Please don't review this version,
> wait for the respin (hoping the SEV cleanup patch get accepted,
> the respin will be focused on OVMF).

Appreciate the note.

Laszlo


