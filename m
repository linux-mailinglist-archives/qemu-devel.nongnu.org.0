Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F6D6F48B0
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 18:54:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pttFV-0001ld-4k; Tue, 02 May 2023 12:53:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pttFS-0001lN-V4
 for qemu-devel@nongnu.org; Tue, 02 May 2023 12:53:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pttFR-0003MC-5a
 for qemu-devel@nongnu.org; Tue, 02 May 2023 12:53:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683046383;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=B402eSepN7fPqT+HgoUbPdthjGzMjGAJUUOhw/IQq0k=;
 b=JcOAziSUBRiu8+4q8AEIueO5cuPHNmF4oVFcO6ucWQpWLpmySIV/4M9jP+8X0U2xgBkFjb
 ZB4/CSkwe7vItJ2mZzoOyFawxmuOPE2Ln34rnn78Ssk7ho7VdP6ZqVrbLf2ADD6Tqu1dhK
 ia49AUd9iyFtGUzCK14sm+XDCEnGp1U=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-547--v7CnaDiN426A7Sydm0yjg-1; Tue, 02 May 2023 12:53:02 -0400
X-MC-Unique: -v7CnaDiN426A7Sydm0yjg-1
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-3ed767b30easo6863021cf.1
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 09:53:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683046381; x=1685638381;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B402eSepN7fPqT+HgoUbPdthjGzMjGAJUUOhw/IQq0k=;
 b=LQw5UOowZL93r+MGxRUSxPEBmKQp1nUpO1fgnIDPfnSiNGFzEoUZzNqScfJsuzSz01
 mDzjMI67q85Nw4prJ458+Oka/TBbaTp1/xtcXGdCCxg1s2botO2ervHBda0RxD+cmOh/
 1m4g9Rsb9biMYX6m+Fy3I7otJOovJGqFzCYYVlrxLhV87k2vdRP0YY8gsJxiWdrLqJGA
 hze9hwhB3Xt2/j/Nfq84Z1wOJyInyvRu/zjB8F+34ZrEgQfPhKLs2351HCUa4Dy1jelY
 YDau7xJtNxPGlMi5Vq6Q3ve62Yvf6dt9nCQ7q9tpNDOxo35jGIt/2pkNpF2WaOY4pTAG
 utUw==
X-Gm-Message-State: AC+VfDyR6dvpqZEIgTMWgXem6RKNN3fi25ajflW3MhDnAGVJLRxDj9JW
 QQNXqPIVNoA3BG68dR3RrWjBrJBNQQyOZMK7q5YlWQ/ko5fTdQCvlkysmn8v5EH6lt5VjE9kT8G
 TrR0P1yjgnKFGXxqNNX0lnLE=
X-Received: by 2002:a05:622a:180f:b0:3ef:3dc3:4a3e with SMTP id
 t15-20020a05622a180f00b003ef3dc34a3emr5151819qtc.0.1683046381182; 
 Tue, 02 May 2023 09:53:01 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4dwDYer7YD0T5L6/IM7aVRiT09OEpGUB+cC454teUAoyzslVrjO98M6zj/5kLpMjJw/7ZWew==
X-Received: by 2002:a05:622a:180f:b0:3ef:3dc3:4a3e with SMTP id
 t15-20020a05622a180f00b003ef3dc34a3emr5151797qtc.0.1683046380840; 
 Tue, 02 May 2023 09:53:00 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-40-70-52-229-124.dsl.bell.ca.
 [70.52.229.124]) by smtp.gmail.com with ESMTPSA id
 w29-20020ac84d1d000000b003e4ee0f5234sm10563895qtv.87.2023.05.02.09.52.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 09:52:59 -0700 (PDT)
Date: Tue, 2 May 2023 12:52:58 -0400
From: Peter Xu <peterx@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-devel@nongnu.org, lukasstraub2@web.de, quintela@redhat.com,
 chen.zhang@intel.com, Leonardo Bras <leobras@redhat.com>
Subject: Re: [PATCH v4 06/10] migration: process_incoming_migration_co:
 simplify code flow around ret
Message-ID: <ZFE/6ngcldly95Jr@x1n>
References: <20230428194928.1426370-1-vsementsov@yandex-team.ru>
 <20230428194928.1426370-7-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230428194928.1426370-7-vsementsov@yandex-team.ru>
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

On Fri, Apr 28, 2023 at 10:49:24PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


