Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D574AB8A4
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 11:29:09 +0100 (CET)
Received: from localhost ([::1]:54682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH1Ge-0000J1-PZ
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 05:29:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1nH0XQ-0001WG-K5
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 04:42:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36188)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1nH0XO-0000Uq-M7
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 04:42:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644226941;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rpp8m5MIJzsAKDPZQqMamiygGmpPCI2lHf59vCCTuDc=;
 b=T/Ep3eFp3ia4mdSeeM6ybzOV1QZM+uVzT8DCX1JeVsDjyGbZWzDtx9If2cBjMkVIXsvBfA
 blxWiARAwVmnrfOBz+7eYsVT+jXhxxKsHoHCOtIxyZgxqyKlcwUbr2k+ZAKdj4bPXo1B9V
 obLReKLyng1nwU1wKr0HOnWmdtBO/FQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-665-eewqD4PlOO2LlvHhqCSlWw-1; Mon, 07 Feb 2022 04:42:17 -0500
X-MC-Unique: eewqD4PlOO2LlvHhqCSlWw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A232381DFB1;
 Mon,  7 Feb 2022 09:42:16 +0000 (UTC)
Received: from angien.pipo.sk (unknown [10.40.208.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E4AA7B022;
 Mon,  7 Feb 2022 09:41:56 +0000 (UTC)
Date: Mon, 7 Feb 2022 10:41:53 +0100
From: Peter Krempa <pkrempa@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v4 2/4] hw/i386: Attach CPUs to machine
Message-ID: <YgDpYTpdk9hJeL6v@angien.pipo.sk>
References: <20220205124526.500158-1-f4bug@amsat.org>
 <20220205124526.500158-3-f4bug@amsat.org>
 <20220207091437.52cf36b1@redhat.com>
 <20220207101843.259f517c@redhat.com>
 <YgDoKlkP9Isdjnv8@angien.pipo.sk>
MIME-Version: 1.0
In-Reply-To: <YgDoKlkP9Isdjnv8@angien.pipo.sk>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pkrempa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pkrempa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Yang Zhong <yang.zhong@intel.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, libvir-list@redhat.com,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 07, 2022 at 10:36:42 +0100, Peter Krempa wrote:
> On Mon, Feb 07, 2022 at 10:18:43 +0100, Igor Mammedov wrote:
> > On Mon, 7 Feb 2022 09:14:37 +0100
> > Igor Mammedov <imammedo@redhat.com> wrote:

[...]

> Even if we change it in libvirt right away, changing qemu will break
> forward compatibility. While we don't guarantee it, it still creates
> user grief.

I've filed an upstream issue:

https://gitlab.com/libvirt/libvirt/-/issues/272


