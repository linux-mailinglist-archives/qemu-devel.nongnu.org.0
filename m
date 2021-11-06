Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A077446DB9
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Nov 2021 12:51:17 +0100 (CET)
Received: from localhost ([::1]:42526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mjKE8-0002c6-F0
	for lists+qemu-devel@lfdr.de; Sat, 06 Nov 2021 07:51:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mjKCv-0001B1-MN
 for qemu-devel@nongnu.org; Sat, 06 Nov 2021 07:50:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mjKCu-0003Az-1l
 for qemu-devel@nongnu.org; Sat, 06 Nov 2021 07:50:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636199398;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MiLh8g4liK3FfDsJlC68GVKC7MX8vNBiDwy5fuSkZkI=;
 b=L+m2XNY+l075hnG2JANRfrkmJjD+X8WRbFlq/1FE9TeSsHLHmIGQnfntinzxj5yzpENy1u
 EwZJaGRYVKB7dhBH8qYzSQ6OSGCA1lwvJWZzguVewIVduXiztN1yzIJgA7sZd1MMBqztGj
 WhpW3dZJC+7MSJKz8l0EnOiFBkIQG7I=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-211-rGpjrWaYOZGGulgvyeCjSg-1; Sat, 06 Nov 2021 07:49:57 -0400
X-MC-Unique: rGpjrWaYOZGGulgvyeCjSg-1
Received: by mail-wm1-f72.google.com with SMTP id
 m14-20020a05600c3b0e00b0033308dcc933so3596719wms.7
 for <qemu-devel@nongnu.org>; Sat, 06 Nov 2021 04:49:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MiLh8g4liK3FfDsJlC68GVKC7MX8vNBiDwy5fuSkZkI=;
 b=vQso7vXkJDmNy5NptCPdI/Q0mSR8lrgcZ4AbcfewpVJYgNrMBdj2wJoplmkOpPEnYB
 DvsqwM9PAdSNmtP9avKp+JfRJKll2BjmxKbz6MgymVdO8HpfzTmL+NFxzJZlQUSohXLJ
 NIBUIjagQSGxjU+AxX0E3yd+6qFHl6tzANm+eTkaf/2Pb/3lr1+sSx3nGhRd9IuOFxnB
 CvVPOVcY+RkemSQkNQxPiaykBH25AFJydjEqVKq2tRc++NJh7UaWzqQ6nmGJfMEzC3tU
 fP+8Do4fvTU07WpuO9QLOOz3e74dDNnUsMO21XZ6CKBYE0aoPlHaol8IHJU3TCPzHBBG
 GEgg==
X-Gm-Message-State: AOAM530O03AgiLdn6hmxK3plhOmXLyU3E+/gH7mxuVRsYFTrlSAuDJVf
 yybW/V8zjlI5fOHZGdwzY73s/zmFzlBVk6TC1Cdlk3x6svDsvyIM0yXLenHg8fTZqrkmAELP63O
 t8RryG+1OAHJenbg=
X-Received: by 2002:a05:6000:144a:: with SMTP id
 v10mr21093292wrx.315.1636199396144; 
 Sat, 06 Nov 2021 04:49:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxQeplgfa14anh/p8Z8vI0iA1UyIMwy0Libido3QHLmOoO1xfsqfWbTanV93Fo6aYeqbGyQ5w==
X-Received: by 2002:a05:6000:144a:: with SMTP id
 v10mr21093269wrx.315.1636199395988; 
 Sat, 06 Nov 2021 04:49:55 -0700 (PDT)
Received: from localhost ([178.139.230.94])
 by smtp.gmail.com with ESMTPSA id i15sm12934186wmq.18.2021.11.06.04.49.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Nov 2021 04:49:55 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Eugenio =?utf-8?Q?P=C3=A9rez?= <eperezma@redhat.com>
Subject: Re: [PATCH v4 1/2] vhost: Rename last_index to vq_index_end
In-Reply-To: <20211104085625.2054959-2-eperezma@redhat.com> ("Eugenio
 =?utf-8?Q?P=C3=A9rez=22's?=
 message of "Thu, 4 Nov 2021 09:56:24 +0100")
References: <20211104085625.2054959-1-eperezma@redhat.com>
 <20211104085625.2054959-2-eperezma@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Sat, 06 Nov 2021 12:49:53 +0100
Message-ID: <87h7cpfqqm.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.735,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: quintela@redhat.com
Cc: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eugenio P=C3=A9rez <eperezma@redhat.com> wrote:
> The doc of this field pointed out that last_index is the last vq index.
> This is misleading, since it's actually one past the end of the vqs.
>
> Renaming and modifying comment.
>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


