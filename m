Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F4B4EBF41
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 12:55:22 +0200 (CEST)
Received: from localhost ([::1]:35840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZVyz-0000q8-59
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 06:55:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nZVwl-0006hO-Uc
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 06:53:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nZVwi-0000TW-Up
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 06:53:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648637579;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oNUseAg39zzq1FKLYliq1kInFPJoBJIY6HsfHDDZ3z0=;
 b=NWExF57hl353iCLroIOYu89zNtkMv2578x0D6ij1F1wOc4Z60asbuPYZpoDm6QjnD8FRx+
 03nTao7/WC9HoYNn1jVSoDiykHzHpjPCDyGfyrn5sSetaMUPpArZM/js5+MLnF2YAg68wv
 eb2f+hX1cNveqYc5da+Z3u5SNjY3kHM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-380-SA33G7yIMSSPxyHiSVwNFA-1; Wed, 30 Mar 2022 06:52:56 -0400
X-MC-Unique: SA33G7yIMSSPxyHiSVwNFA-1
Received: by mail-wm1-f72.google.com with SMTP id
 r203-20020a1c44d4000000b0038c8655c40eso5628508wma.6
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 03:52:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=oNUseAg39zzq1FKLYliq1kInFPJoBJIY6HsfHDDZ3z0=;
 b=kp0etO43AaX3AmTN4jPOiRljgDqM3Mfllxq50/0G5qPEz3R2Hs/1kaig0hEfNB7Uzd
 CqF168UCVvKO7JGb9nHf/gwOLz3Y33EV5m8hIbL4znMaJhmf30acHOVSr/fE52jFwFcn
 y0mDXww/HEz8Abnae0U8KVf4h2mEXqgp9d4tdUWoEjOyOU5GvVzrjbuXTWoNYNIjG8qD
 gMzC4oD7vaOyIJ+Hg7+nUL8ZdDX73p/VFepe7jbVnDrBN/PQXZNIrmQ32ww7n3NaDY/3
 SJFwlF3TO76TUkJaJW2VGwCiQ6hZW1zdKJxLaX6o0RPGljXaYpv0idqQE5N2eYD/0VZs
 CJbA==
X-Gm-Message-State: AOAM530/YsMA4CaEYEoHt0Mf1Ua6QPhlZoiyDFnbPcJ9SwWPfMy7fCJE
 7SlR1LFxI5O9dMBAiU70KK/53zy2q5IJeMT+dEAiYkM81ew2WlDt6l8DH3oX90ClaZCA0b28AYD
 jeSVNgMchIpduiic=
X-Received: by 2002:a05:600c:3785:b0:38c:9b55:a477 with SMTP id
 o5-20020a05600c378500b0038c9b55a477mr3773561wmr.164.1648637575073; 
 Wed, 30 Mar 2022 03:52:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxXKIMCeo16R6ofR0j7gP+z5W0GyRoGjieYu/eGBV2dKsYilKM0oxoOSVrwQYv6F5sFOkrmEQ==
X-Received: by 2002:a05:600c:3785:b0:38c:9b55:a477 with SMTP id
 o5-20020a05600c378500b0038c9b55a477mr3773541wmr.164.1648637574883; 
 Wed, 30 Mar 2022 03:52:54 -0700 (PDT)
Received: from redhat.com ([2.52.9.207]) by smtp.gmail.com with ESMTPSA id
 y13-20020adffa4d000000b00203e3ca2701sm23479469wrr.45.2022.03.30.03.52.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 03:52:54 -0700 (PDT)
Date: Wed, 30 Mar 2022 06:52:49 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: 08005325@163.com
Subject: Re: [PATCH v2] vdpa: reset the backend device in stage of stop last
 vhost device
Message-ID: <20220330065216-mutt-send-email-mst@kernel.org>
References: <1648024966-5170-1-git-send-email-08005325@163.com>
 <1648634561-12504-1-git-send-email-08005325@163.com>
MIME-Version: 1.0
In-Reply-To: <1648634561-12504-1-git-send-email-08005325@163.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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
Cc: lulu@redhat.com, jasowang@redhat.com, qemu-devel@nongnu.org,
 eperezma@redhat.com, Michael Qiu <qiudayu@archeros.com>, si-wei.liu@oracle.com,
 lingshan.zhu@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 30, 2022 at 06:02:41AM -0400, 08005325@163.com wrote:

It's an empty patch.

-- 
MST


