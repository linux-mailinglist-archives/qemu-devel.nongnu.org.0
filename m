Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18282213FFB
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jul 2020 21:26:21 +0200 (CEST)
Received: from localhost ([::1]:36764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jrRKF-0001sn-KS
	for lists+qemu-devel@lfdr.de; Fri, 03 Jul 2020 15:26:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jrRJP-00018W-Ei
 for qemu-devel@nongnu.org; Fri, 03 Jul 2020 15:25:27 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:30909
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jrRJM-000761-L6
 for qemu-devel@nongnu.org; Fri, 03 Jul 2020 15:25:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593804322;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/5uO1WiFS166xvwRhC+E9Vyt4bSa1BWtDulyrqCToaE=;
 b=i09fEgXPD6Q9XIs4y8I8O8nO7687IKkBIHl4zrT34Xoj+YjqS6VYOBDxVTVIASG+tgKV1j
 276fqUPwVu23OlsZJoyMgi833I0hAVzCuZWvKDkVJyocjc3T9xJwaEvItZ6q8Hvn3jDKEO
 AfhKO5D1BXfgPefB2sCZUTPo/5hvbFo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-96-fYZ2kzhyNgmxwC9ma97Wtw-1; Fri, 03 Jul 2020 15:25:21 -0400
X-MC-Unique: fYZ2kzhyNgmxwC9ma97Wtw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 94093800C64;
 Fri,  3 Jul 2020 19:25:18 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-62.ams2.redhat.com
 [10.36.112.62])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E1D615DD63;
 Fri,  3 Jul 2020 19:25:11 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B282616E16; Fri,  3 Jul 2020 21:25:10 +0200 (CEST)
Date: Fri, 3 Jul 2020 21:25:10 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v4 08/21] microvm/acpi: add minimal acpi support
Message-ID: <20200703192510.laaeku6kvudcs4g2@sirius.home.kraxel.org>
References: <20200702204859.9876-1-kraxel@redhat.com>
 <20200702204859.9876-9-kraxel@redhat.com>
 <20200703084039-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20200703084039-mutt-send-email-mst@kernel.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/03 15:25:22
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 qemu-devel@nongnu.org, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 03, 2020 at 09:09:43AM -0400, Michael S. Tsirkin wrote:
> On Thu, Jul 02, 2020 at 10:48:46PM +0200, Gerd Hoffmann wrote:
> > +    /* copy AML table into ACPI tables blob and patch header there */
> > +    g_array_append_vals(table_data, dsdt->buf->data, dsdt->buf->len);
> > +    build_header(linker, table_data,
> > +        (void *)(table_data->data + table_data->len - dsdt->buf->len),
> > +        "DSDT", dsdt->buf->len, 5, NULL, NULL);
> 
> Why 5? Just curious ...

IIRC because the hw reduced hardware profile needs acpi 5+ ...

take care,
  Gerd


