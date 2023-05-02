Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7156F4890
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 18:44:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptt5z-0007Kn-Ds; Tue, 02 May 2023 12:43:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ptt5v-00073l-Qh
 for qemu-devel@nongnu.org; Tue, 02 May 2023 12:43:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ptt5t-0007Ok-LK
 for qemu-devel@nongnu.org; Tue, 02 May 2023 12:43:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683045792;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JRvsYvwBX7B9bMKpTsB8QFH75AcPgeH/XNcB/tdu/6E=;
 b=W9sgFfj5KT+Fya/JykP13GXf6I2DyEu1uyhzoYPbDRPAVUOAtsPv5MYv6oe74uFCWsQtAd
 K+khX4c7whZav/90/1c7hDcbK635fjgjTYWatU8r+H8oe10BEnE+hYwVcb0ASYsd+hLHJo
 lZb1+4vEy66ZPmYjEj0qxBdNAxevSm4=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-617-XNAjswwVNp-gI4flq-LXXA-1; Tue, 02 May 2023 12:43:11 -0400
X-MC-Unique: XNAjswwVNp-gI4flq-LXXA-1
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-74deffa28efso20499585a.1
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 09:43:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683045791; x=1685637791;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JRvsYvwBX7B9bMKpTsB8QFH75AcPgeH/XNcB/tdu/6E=;
 b=U5N3Nv479/Iwl8cXqwHgfSnLRNOrNrcrYxpXYRsjDEIQSCnr6t267nnDV/Ra/U98oS
 ZhRX9sd7QHZloT9alT9SNn+Ro4+4/YLYAo7Xk44BQ1zLmkfRUZKF6hB/bLGXfwAN2bJB
 tOEAi6XDZLea047LmO0/w7rni11SdqnsY70QHuYIKV+2yORVWZhCtaZWVxHOTfAWAYvO
 sB8AzcX24j0sKVk+c5IVi1o7aWZKtOX9wylU2W9oGXSo2+ZBhvtsnQROQ0mG0gXY/OwB
 F/hEwJNHDVifIVP4ZsBm8NDS9XYnSj7JaFI0MrEqcPNScF9JlNKyl3KgL+48+k1CmcGR
 cA+w==
X-Gm-Message-State: AC+VfDzv0QrmH32dIw49i1FcB3eWjwPvAiSPQdYub2N7Jj0bfnUTdy1T
 lLYCH9nzbt8/JfGGI5E2JpOQOFo8m0ZqKQAK5oQtAquHgEkXTo3K/OzJfptsBctIArMr1UeDXgP
 YRsXwssmA0xJ6bXs=
X-Received: by 2002:a05:6214:518e:b0:5aa:14b8:e935 with SMTP id
 kl14-20020a056214518e00b005aa14b8e935mr4551793qvb.2.1683045790919; 
 Tue, 02 May 2023 09:43:10 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7aBEwPvf76OPeErqt0I6adf4m6BglhtBRRPjsc8YqvhwPMZmfdD8jHxyeiBstu4KT+ijgg8g==
X-Received: by 2002:a05:6214:518e:b0:5aa:14b8:e935 with SMTP id
 kl14-20020a056214518e00b005aa14b8e935mr4551771qvb.2.1683045790664; 
 Tue, 02 May 2023 09:43:10 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-40-70-52-229-124.dsl.bell.ca.
 [70.52.229.124]) by smtp.gmail.com with ESMTPSA id
 g7-20020a0ce4c7000000b005dd8b9345casm9655817qvm.98.2023.05.02.09.43.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 09:43:09 -0700 (PDT)
Date: Tue, 2 May 2023 12:43:08 -0400
From: Peter Xu <peterx@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-devel@nongnu.org, lukasstraub2@web.de, quintela@redhat.com,
 chen.zhang@intel.com, Leonardo Bras <leobras@redhat.com>
Subject: Re: [PATCH v4 05/10] migration: drop colo_incoming_thread from
 MigrationIncomingState
Message-ID: <ZFE9nB/ymToW25es@x1n>
References: <20230428194928.1426370-1-vsementsov@yandex-team.ru>
 <20230428194928.1426370-6-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230428194928.1426370-6-vsementsov@yandex-team.ru>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Apr 28, 2023 at 10:49:23PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> have_colo_incoming_thread variable is unused. colo_incoming_thread can
> be local.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


