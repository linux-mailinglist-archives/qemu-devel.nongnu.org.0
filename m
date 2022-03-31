Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 131A14EE0FC
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 20:46:26 +0200 (CEST)
Received: from localhost ([::1]:52446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZzoP-0007qw-6G
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 14:46:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nZzZQ-0005Ur-RW
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 14:30:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33358)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nZzZP-0004bN-Ct
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 14:30:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648751454;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wqeRyMd4XKneb/AG7E6oEXxBnZkMFMHWYStW0LLVJuI=;
 b=aW6+y4db4U8TLQ6lTbO4xSsF8tW1fogf+o9c0kRyPZTdLJRP2ImF7F7WdNulK11RprMYxg
 ikrxILkAycudNBwLXoFRElqHOusEE+Kz+szIYhipj5qUG6zybEunNuUDogGNJW1+4ZzdbQ
 dCQda7BE+ZtGxZ3TjQN0X0FK1Sobm1I=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-504-t9b1dmCsMIyIKuIEXWdeqQ-1; Thu, 31 Mar 2022 14:30:53 -0400
X-MC-Unique: t9b1dmCsMIyIKuIEXWdeqQ-1
Received: by mail-qt1-f198.google.com with SMTP id
 p6-20020a05622a00c600b002e1cb9508e8so157659qtw.20
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 11:30:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=wqeRyMd4XKneb/AG7E6oEXxBnZkMFMHWYStW0LLVJuI=;
 b=o5MfSMnxIb/kziGWG48ed688vlvIbae0/XcJgE1Y01dW8WYZyPs5tq6ySXv1JXBPjQ
 pQWawH8ifinah0yxeM+k1TvecK7GA8m97+jj8K9iA/uCUgcYmJDbOjUP7B19hbBdlZoI
 nVItt20tD7xFX/yaDDjoUsXzIUBAw0LDrVo/fUn2aCO5B+21qbJyV5q9QzPANhNRCyRo
 79AxLelMJ38icdGyHu26DKlEepRR4oEtzVzOowV1JHl3hILVY3WfUWS1P8QQ5b7WuHUW
 bJPdzEi7SgtZHIMTsKC64AbqaVAKhS1hYvVAwzrfWIoEEHFZRFeW/0ZW8siuOM3iyZPu
 4yHA==
X-Gm-Message-State: AOAM531ppOQ0Do2KcQmm2pFVUVp/BG3bkyoi+6pXC3k0twGO262Q75Tj
 rkTmz/eEU/Ec/MdTIjQneM1jvFgEKbsv0PhO7vSsxrE/coTrHLM6Wtg5M/RSQYGE1U8AjVVjl0v
 C6qAHC6cdFniyH7o=
X-Received: by 2002:a0c:f801:0:b0:427:47d3:3715 with SMTP id
 r1-20020a0cf801000000b0042747d33715mr36818526qvn.46.1648751453108; 
 Thu, 31 Mar 2022 11:30:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwc53MPLroqefayhAFrDHqYBmpIukK6Xpn1VNb9VM8bx/hX9hxYjd0l/oELM6xFuc7D7dACZw==
X-Received: by 2002:a0c:f801:0:b0:427:47d3:3715 with SMTP id
 r1-20020a0cf801000000b0042747d33715mr36818508qvn.46.1648751452899; 
 Thu, 31 Mar 2022 11:30:52 -0700 (PDT)
Received: from xz-m1.local
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 j1-20020a05620a288100b0067b1be3201bsm25816qkp.112.2022.03.31.11.30.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Mar 2022 11:30:52 -0700 (PDT)
Date: Thu, 31 Mar 2022 14:30:51 -0400
From: Peter Xu <peterx@redhat.com>
To: Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>
Subject: Re: [PATCH] util: Return void on iova_tree_remove
Message-ID: <YkXzWzb7Z9ee0hGF@xz-m1.local>
References: <20220331181712.535039-1-eperezma@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220331181712.535039-1-eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
Cc: qemu-trivial@nongnu.org, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 31, 2022 at 08:17:12PM +0200, Eugenio Pérez wrote:
> It always returns IOVA_OK so nobody uses it.
> 
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


