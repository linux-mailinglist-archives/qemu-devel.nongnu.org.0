Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3C93D0B97
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 11:53:06 +0200 (CEST)
Received: from localhost ([::1]:50272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m68uS-0001Rh-8i
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 05:53:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m68tW-0000lg-4S
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 05:52:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m68tU-0001Bw-Fi
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 05:52:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626861119;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v0IncUWFHptDVmUhFopWsR9kzSasfvN429bjosML7Fg=;
 b=eJWDIPcqe14cXrMZtqJWyzzNPwI/yGWlh7ctB7uthMNjThHmglPY7hpoAmBy+HCFYfZHDn
 qm9E+QED/hpDNGNg4P0vOeGnfcEauz4Z9ztfiF033jPMppoF2VrHOegAx2dMJxaAUKOotm
 sm7N9W1Mtxpxi8VvhSIuYTrl393S7s0=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-455-_wQWrCrtOeef3GFsErpjFw-1; Wed, 21 Jul 2021 05:51:58 -0400
X-MC-Unique: _wQWrCrtOeef3GFsErpjFw-1
Received: by mail-ej1-f69.google.com with SMTP id
 y3-20020a17090614c3b0290551ea218ea2so591973ejc.5
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 02:51:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=v0IncUWFHptDVmUhFopWsR9kzSasfvN429bjosML7Fg=;
 b=GKLVxT+lSdZ/PGieTTLESD14q99RrRtjYFhfA8WNn+1tnpvGfvaA4scCcVP60T7DTe
 S2TUoXJfJelOz80mvjlryv/T63DkiaXtG8B3Vd0ZMr4TzuqdSvShYZq12R5i82N0C5yu
 UlZjMAkanKsR695pf273DcMv+NX7dx1rkkqB+Jg3Gv0EgJoFTikoWSd23K5B24by9Drq
 B7xqu8qjHtUGHvWgmRsK+MTsU4P3CabQKCZLymB0jf9cpVy16rcNdoPOFrjVKuQe3+2i
 oeocwlcR3krR2U3bXNKRNU3aagh81dUfznJ0B5LQc1e4RvyfU4qsWQ1KMIzFAVm3sNiq
 Vviw==
X-Gm-Message-State: AOAM5319eJbggO6jXt8GC0QknrfgBw5BumSBcWfUIevunjzgH6r5EEmn
 fxLymP6oNI4sNh28jxqpCg8mpNxjkZaGOp8wyzalh0eFMB/5eCfenMHpy7gRlLTB9J7rPvji7ki
 ZNjan7yLaiqDOrmM=
X-Received: by 2002:a05:6402:35c8:: with SMTP id
 z8mr14749855edc.5.1626861117481; 
 Wed, 21 Jul 2021 02:51:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyAU8DiPB7KBu6VDsGIFBUQj04Zl2RnacY7XQHTQkUrl33WJ2A9ZbBOtgvo4rh6LIoiBj16YQ==
X-Received: by 2002:a05:6402:35c8:: with SMTP id
 z8mr14749831edc.5.1626861117249; 
 Wed, 21 Jul 2021 02:51:57 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id cq22sm10562316edb.77.2021.07.21.02.51.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jul 2021 02:51:56 -0700 (PDT)
Subject: Re: [PATCH 2/2] qom: use correct field name when getting/setting
 alias properties
To: Eric Blake <eblake@redhat.com>
References: <20210719104033.185109-1-pbonzini@redhat.com>
 <20210719104033.185109-3-pbonzini@redhat.com>
 <20210720010005.vegqnbb5qhfxh7ow@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <ab9bb88a-ccb8-6242-5960-2eb1a43f0c56@redhat.com>
Date: Wed, 21 Jul 2021 11:51:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210720010005.vegqnbb5qhfxh7ow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, imammedo@redhat.com, alex.williamson@redhat.com,
 qemu-devel@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/07/21 03:00, Eric Blake wrote:
> Deceptively simple; all the work was in the previous patch writing up
> the forwarding visitor.  I still wonder if Kevin's QAPI aliases will
> do this more gracefully, but if we're trying to justify this as a bug
> fix worthy of 6.1, this is certainly a smaller approach than Kevin's.
> 
> Reviewed-by: Eric Blake<eblake@redhat.com>

As discussed on IRC, this is unrelated to QAPI aliases; QOM alias 
properties typically target a property *on a different object*.

This is a regression, so it certainly has to be fixed in 6.1 one way or 
the other.

Paolo


