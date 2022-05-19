Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA01C52C92D
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 03:18:40 +0200 (CEST)
Received: from localhost ([::1]:53770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrUoJ-0000H7-K2
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 21:18:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nrUmx-00082b-Ga
 for qemu-devel@nongnu.org; Wed, 18 May 2022 21:17:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nrUmu-0006Il-Ad
 for qemu-devel@nongnu.org; Wed, 18 May 2022 21:17:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652923030;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kty4tIDH6P0rV1GImoTmGYwYW/HzIAXaKmMo4UsSlWo=;
 b=LuBc8QdYvKw7/wUCgJvVDrtXDYxjRh6NqWuElu4uHJ96NIOr0SwVoCJXt9xSbE3bC2POGz
 UaWVY9r99Yf9SaLtnbdWxFyAwlrIb3rapbWSrCGpA8WIownQm/nrLockv+8rxCdvOoRXiD
 wudSrp4DGQI4ushHITNZYDp2+5zVlfM=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-216-bGLUnVVtO5uXlpKdCoI93w-1; Wed, 18 May 2022 21:17:09 -0400
X-MC-Unique: bGLUnVVtO5uXlpKdCoI93w-1
Received: by mail-il1-f199.google.com with SMTP id
 l13-20020a056e0212ed00b002d07cd1db63so2229182iln.7
 for <qemu-devel@nongnu.org>; Wed, 18 May 2022 18:17:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=kty4tIDH6P0rV1GImoTmGYwYW/HzIAXaKmMo4UsSlWo=;
 b=vtsxyJG/WBS8T/U0rosaAnOcNRyivpCzbjv8mZwWbBIDK8zj0lkHwWRERSRzIcG+7s
 h00miSJxchVBJygrc0F//V4DyKGe9I3iUCbARpvhsbYxalj6ZpDf0xP777MTuDpOd4Cy
 67Fu632S2rL5ISTrbOXQ+VyrYqGGV+H0V7emFVf5iLnRHGofN1ABeh4feBTgkMt+Bat6
 LANc339+TSmWIuJHoBlV1Lth8ZXfgNXUkA9cWoi4H68uchp/ZwYaXaFH1eh0S7Yg/QgA
 Vmdyoya4ig3pcwe1BPHkjNtaLimL6KCJ/cAhPDAvWgHlOuMxMmuo3GXPy79jbuGWvSH1
 /uRQ==
X-Gm-Message-State: AOAM530uqGChusCdtisf/kDm9LuB50f/SqZhazOXTIJM5rJ+h9fWGVVu
 OqAL6rNfnzECac+iELqqsJH+evTf7sfOW21UROEu6FDakwTCiZwEwkj48z7jl+z2p2ldSVgDu40
 /ZRqTLTg5ZVg4HVI=
X-Received: by 2002:a05:6602:2c8b:b0:65a:df00:f3b3 with SMTP id
 i11-20020a0566022c8b00b0065adf00f3b3mr1202568iow.125.1652923028733; 
 Wed, 18 May 2022 18:17:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyDv0XilkY7rRG+K5MqpBVkR0OpWvfJcKguqtGTmrdml+d4nOks4l7z737tKNhiHxqxjgK/fQ==
X-Received: by 2002:a05:6602:2c8b:b0:65a:df00:f3b3 with SMTP id
 i11-20020a0566022c8b00b0065adf00f3b3mr1202561iow.125.1652923028536; 
 Wed, 18 May 2022 18:17:08 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 i6-20020a02c606000000b0032e7332891fsm305510jan.30.2022.05.18.18.17.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 May 2022 18:17:07 -0700 (PDT)
Date: Wed, 18 May 2022 19:17:07 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Stefan Berger <stefanb@linux.ibm.com>
Cc: qemu-devel@nongnu.org, Eric Auger <eric.auger@redhat.com>, Cornelia Huck
 <cohuck@redhat.com>
Subject: Re: [PULL 07/11] sysemu: tpm: Add a stub function for TPM_IS_CRB
Message-ID: <20220518191707.63b52b6b.alex.williamson@redhat.com>
In-Reply-To: <4735be0f-d7da-eb1d-5857-d6c38b2d1e16@linux.ibm.com>
References: <165186988363.4166595.3147442303200167674.stgit@omen>
 <165187011323.4166595.4846048800121434051.stgit@omen>
 <4735be0f-d7da-eb1d-5857-d6c38b2d1e16@linux.ibm.com>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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

On Wed, 18 May 2022 20:46:02 -0400
Stefan Berger <stefanb@linux.ibm.com> wrote:

> On 5/6/22 16:48, Alex Williamson wrote:
> > From: Eric Auger <eric.auger@redhat.com>
> > 
> > In a subsequent patch, VFIO will need to recognize if
> > a memory region owner is a TPM CRB device. Hence VFIO
> > needs to use TPM_IS_CRB() even if CONFIG_TPM is unset. So
> > let's add a stub function.
> > 
> > Signed-off-by: Eric Auger <eric.auger@redhat.com>
> > Suggested-by: Cornelia Huck <cohuck@redhat.com>
> > Reviewed-by: Stefan Berger <stefanb@linnux.ibm.com>  
> 
> Oops, a typo here: linnux -> linux

Yup, sorry, didn't notice until it was too late, but that was as
provided by you:

https://lore.kernel.org/all/96940f79-a6e0-d14f-5d74-abe280846f26@linux.ibm.com/

Thanks,

Alex


