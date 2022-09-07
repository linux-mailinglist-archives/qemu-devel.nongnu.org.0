Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A42805AFE83
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Sep 2022 10:05:46 +0200 (CEST)
Received: from localhost ([::1]:34986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVq42-0003x6-SB
	for lists+qemu-devel@lfdr.de; Wed, 07 Sep 2022 04:05:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oVpyi-00021P-Tx
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 04:00:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oVpyf-0003Yh-Ke
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 04:00:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662537604;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BbggOggjIbbshLARdxThsbeQ3LuPCEzhQ877zu0sj4s=;
 b=cvyduiZE59E03yjr3eoyHIIKssxnyEKcI2t9AiUjZArbqyDxK+FlX8s10LYPP4CakQnzlX
 IBPBKL2NOTbwHE+4p62nY9sxMFjqVo+4Pb6zZv/eRArZBlDvatYC9lb7KfI07s1w7hFQh9
 H2SiuXbPBcx3vrCqvzi9w2dG67c1usE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-520-UZU4ZL5oPneKxmDNhXdIjw-1; Wed, 07 Sep 2022 04:00:00 -0400
X-MC-Unique: UZU4ZL5oPneKxmDNhXdIjw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EFD5C8037AE;
 Wed,  7 Sep 2022 07:59:59 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.195.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9BEB44010D2A;
 Wed,  7 Sep 2022 07:59:59 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 01DB1180039B; Wed,  7 Sep 2022 09:59:57 +0200 (CEST)
Date: Wed, 7 Sep 2022 09:59:57 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH v3 2/2] x86: re-enable rng seeding via setup_data
Message-ID: <20220907075957.posbrkdwzm23q7ts@sirius.home.kraxel.org>
References: <YxcmRhwrtGBsMGev@zx2c4.com>
 <20220906112720.292836-1-Jason@zx2c4.com>
 <20220906112720.292836-2-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220906112720.292836-2-Jason@zx2c4.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 06, 2022 at 01:27:20PM +0200, Jason A. Donenfeld wrote:
> This reverts 3824e25db1 ("x86: disable rng seeding via setup_data"), but
> for 7.2 rather than 7.1, now that modifying setup_data is safe to do.
> 
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Laurent Vivier <laurent@vivier.eu>
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>

Acked-by: Gerd Hoffmann <kraxel@redhat.com>


