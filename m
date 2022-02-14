Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE164B4681
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 10:50:17 +0100 (CET)
Received: from localhost ([::1]:57146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJXzs-0004gV-KF
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 04:50:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nJXx3-0003Fa-Fa
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 04:47:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28064)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nJXx0-0000rl-Fp
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 04:47:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644832037;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fALgFcz8IwrUXKhov7SKL5Z/cy6dzpuemX9JStl5N5s=;
 b=UjbyyIQ2tkESc9DMXbXOfxkIRGrzcnpR/iUPUsn5KhKzvYIg8zCW1XFS0blSZUOOYYWNLT
 NDxt5ZThdgAgre4UuovQbQUl8BL2Igv9HMBDBZ6T5HVSH7k/2RNOEfh+J5dvqQCBfl60QP
 eXfhthB0pu5L/gMH3jy55Jc14cOg/z8=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-531-4CN2ytj_OIqD1XCOlkW8fQ-1; Mon, 14 Feb 2022 04:47:15 -0500
X-MC-Unique: 4CN2ytj_OIqD1XCOlkW8fQ-1
Received: by mail-pf1-f198.google.com with SMTP id
 d16-20020a056a0010d000b004e0204c9753so11418323pfu.7
 for <qemu-devel@nongnu.org>; Mon, 14 Feb 2022 01:47:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=fALgFcz8IwrUXKhov7SKL5Z/cy6dzpuemX9JStl5N5s=;
 b=hvF/NpTYKHAbds55vBUp9H5WO3viY1CNXtA1PWIRqT+a+yIB87PESF5TnMvMNbtbvP
 2D5Ww64vaAjAjDRelXGSvl4w1k/iu8d9ccykaXPuw2tdaDXb43Lno5u7S2wKydigf82Q
 nl94+S/VOr+OmOS52LIzOxg+dBCWFZd5sLUlvmfAxd2u/wsxfs7mjjCbg2ncmsvfO5Bl
 aqqMV53Mh6LuKYwlhj40EmY7+zj3PI+dt7ZLVlwFA97psKSykR/4fgQfXFEngKxw35RM
 iZoXsygfcy0ZXmsLyDYIW4QvfwKfsnN1fr7hVQ1TuMWwkIbekzdWaCitVqVUfOeI5mc5
 w3LQ==
X-Gm-Message-State: AOAM533B4MT4WdOxWcjaRcEgcEODsUf9icG5i6kzlhlzq0mIh+FLfsli
 e//ObaeGjNFyBpp3cYTKUQ5p/5pQhmzGdiVvLSbP8ZIkS5E8UGSKuNBIcljCOQmxTiGX1BB+yOj
 YHf5Qcxctgx6sN6I=
X-Received: by 2002:a63:f108:: with SMTP id f8mr9388685pgi.22.1644832034747;
 Mon, 14 Feb 2022 01:47:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw8sOKmtC37ODelT7H2e3x4OM7RXg3qNwAo67wrZ2aTgLOyATewVPozf2nQhOwcfM0FF34Y4Q==
X-Received: by 2002:a63:f108:: with SMTP id f8mr9388670pgi.22.1644832034532;
 Mon, 14 Feb 2022 01:47:14 -0800 (PST)
Received: from xz-m1.local ([94.177.118.137])
 by smtp.gmail.com with ESMTPSA id j12sm30415669pfu.79.2022.02.14.01.47.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 01:47:14 -0800 (PST)
Date: Mon, 14 Feb 2022 17:47:07 +0800
From: Peter Xu <peterx@redhat.com>
To: Hyman Huang <huangy81@chinatelecom.cn>
Subject: Re: [PATCH v14 3/7] migration/dirtyrate: Refactor dirty page rate
 calculation
Message-ID: <YgolG3nskBWuqUcW@xz-m1.local>
References: <cover.1644509582.git.huangy81@chinatelecom.cn>
 <5984c1faf2de00df1a4add819fdab5cbe4014746.1644509582.git.huangy81@chinatelecom.cn>
 <YgoLa4B7Eq8OOJq7@xz-m1.local>
 <7ea51695-9590-bd9b-1d7d-49e8e5571f88@chinatelecom.cn>
MIME-Version: 1.0
In-Reply-To: <7ea51695-9590-bd9b-1d7d-49e8e5571f88@chinatelecom.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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
Cc: Eduardo Habkost <eduardo@habkost.net>, David Hildenbrand <david@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Markus ArmBruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 14, 2022 at 04:40:31PM +0800, Hyman Huang wrote:
> Dropping this parameter is fine from my point view if we ignore the duration
> error result from the delay between caller and callee of
> 'vcpu_calculate_dirtyrate’

Agreed, then let's drop it.

-- 
Peter Xu


