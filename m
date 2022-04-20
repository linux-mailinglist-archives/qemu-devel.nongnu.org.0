Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE697509036
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 21:16:22 +0200 (CEST)
Received: from localhost ([::1]:33310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhFoL-0006TT-Kx
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 15:16:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nhEoi-0002Gk-9G
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:12:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nhEoc-0002Ay-Qj
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:12:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650478353;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=A0wouFNpxd0De5UjBznGkN3uqWwIMMRMjJHffxFE5Ys=;
 b=Zi5iEiD+E6KLQi2Xpn0UdBNyQTXHOEzkEV+nW+9hwxYUqHS/WFEcprdDfS690HhidosUFh
 9mg420/Mqn1XjKK/ab8gIZHdsJJyJGiJO6QGLoFm5sG7c/Leda4G1dq82U9VzxUu0kXImY
 7o67f0+Zko5OmMTRR+zuj2lcFnmKlk0=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-356-QVhnlURFNvu05AhI9YdoOg-1; Wed, 20 Apr 2022 14:12:32 -0400
X-MC-Unique: QVhnlURFNvu05AhI9YdoOg-1
Received: by mail-io1-f71.google.com with SMTP id
 k2-20020a0566022a4200b00654c0f121a9so1745504iov.1
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 11:12:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=A0wouFNpxd0De5UjBznGkN3uqWwIMMRMjJHffxFE5Ys=;
 b=erqEKMz0yWcRaNSmclXJXPSZEQpP+0+n8gBDEdTkm3QIy0g0wTiIxlRYywqfBiIjXP
 1lZLNFSTRqQ+Hstjkglb1PGqNWFIdGQBytVX/hWaeVjs4ByfPddXxTXYjzCJhjFAYFug
 Wkb0Sl3QCVMFtuOZmVaz3t6+whiGKkZYwYUdEl61lEiA6TA//0bEicKxpri+2Z7fyTw8
 RYWSH8H6eaC6pKr0PJFmfNDwd6e5bR7aRGfVgBFPkU0BX4XfgPA+bFeTACLUt5CRkaIg
 NZWvsW30DHYWX17yL5zKgGdAsbYzdvSjeAF5EGsoatVTCgJLcdQs6f6aKbIOJOlqrai1
 ZwWg==
X-Gm-Message-State: AOAM5332XoYXOI8fI+Zzb9c+7y9hsGahyMInSf7MEgb6QSF8naQqyKdG
 9RFUE60bTctCm6dUbh6F0OWkDp8nAytROugbc9OtP1HjL3FLXdK6jldXAqOlor7xss/NHmzI1CZ
 NttU3S7DeLg9qQr8=
X-Received: by 2002:a05:6638:1450:b0:32a:8386:c9cd with SMTP id
 l16-20020a056638145000b0032a8386c9cdmr3587500jad.249.1650478351581; 
 Wed, 20 Apr 2022 11:12:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwDCLVz7OgyUoiALd5hvernC7MdfE1SY1mkhT7tJxQc1NmcJOmWGw/yYbqyxFCt92R32WYhyw==
X-Received: by 2002:a05:6638:1450:b0:32a:8386:c9cd with SMTP id
 l16-20020a056638145000b0032a8386c9cdmr3587490jad.249.1650478351354; 
 Wed, 20 Apr 2022 11:12:31 -0700 (PDT)
Received: from xz-m1.local
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 y12-20020a056e02178c00b002cc2cd7409fsm5378496ilu.48.2022.04.20.11.12.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 11:12:30 -0700 (PDT)
Date: Wed, 20 Apr 2022 14:12:29 -0400
From: Peter Xu <peterx@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: introducing vrc :)
Message-ID: <YmBNDddW4ODveOkZ@xz-m1.local>
References: <dd5a574f-a475-a704-a827-03a014f5a586@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <dd5a574f-a475-a704-a827-03a014f5a586@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 qemu block <qemu-block@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 19, 2022 at 04:39:13PM +0200, Paolo Bonzini wrote:
> Hi all,
> 
> a while ago I looked at tools that could be used too build a call graph.
> The simplest but most effective that I found was a small Perl program
> (called "egypt", which is rot13 for "rtlcg" aka RTL call graph) that used
> the GCC dumps to build the graph.

Paolo,

Do you have any plan to put it into some git repository?

Thanks!

-- 
Peter Xu


