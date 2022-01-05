Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB7C4859C3
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 21:07:20 +0100 (CET)
Received: from localhost ([::1]:37546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5CZ4-0000Hk-JQ
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 15:07:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1n5CXb-0007wp-3t
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 15:05:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38410)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1n5CXY-0004cL-VJ
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 15:05:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641413142;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cHwb+271CkUySLteYv9wAtlcJOdn2/2shTKs1/dhN38=;
 b=EUdN4Sl/SVUSJ8eRIJFHeenMhN9X+1r4mhcuKfPK1YCFSl3vhjKWvB1TWG/4WgGpB5/1s9
 JLeODuQXfdTqIBMxzSQ64Q4riSqw6qEVsS7ZU+0WBdpTIlUCIq19qZaYBcv9l3zgNMm6IZ
 SWHaSHphLW2QpMh5sBD1B9CUqzHaons=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-460-EZ2wBiauMDGli4haBOe9Fw-1; Wed, 05 Jan 2022 15:05:41 -0500
X-MC-Unique: EZ2wBiauMDGli4haBOe9Fw-1
Received: by mail-oo1-f69.google.com with SMTP id
 k15-20020a4abd8f000000b002dad9892c92so9850oop.5
 for <qemu-devel@nongnu.org>; Wed, 05 Jan 2022 12:05:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cHwb+271CkUySLteYv9wAtlcJOdn2/2shTKs1/dhN38=;
 b=VnxoFSMwC6QTXeEu9VM75LBMNA3kMrqDnhoT41kyXq9slSofojWhoiHgxDshPhQvhf
 vqL6slpq6xFMRQW6dwXe6IAoVkQ2UE4LjjgTwGLNo6J3YKp5Et0p7xnb1dNHzLYw6LXT
 QLckr9Dm95D2x0cm+1XdtO9w1L9+uRluUMFsfDWK2zPE4Oge7TJkS+RGOQWPC/KqqrGi
 ZlHyDjUWcjg6w0FAXP3NxC2xVE6OUrGk/Zh4sdTiBiPnFBzbAe7t2gJbhMsoVfnXJ109
 pyHBex8M4NHy1a+KW0UgMq3JluHxJi5Dsa/loTkLdPBA/absUah1jtIZhvYABLu3sYYE
 RARw==
X-Gm-Message-State: AOAM530oPCUPceyuzKQ5oWnUarfLJki2yzp23J3STh67rgFr+vG+IAuy
 dYiGxVILSYVJHyZETSSQfddSimNSBOq63AHC00uFE7A+1gstR5cja031xjmeAeXzmMQ3xvmMu+o
 qiaiat0nk2UIGcuA=
X-Received: by 2002:aca:d608:: with SMTP id n8mr3777502oig.88.1641413140828;
 Wed, 05 Jan 2022 12:05:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwFM1jZ/1IT4Kej1ejOJ47HTWYlQG2oROwBKrimNlEThTkn0G+L8vPnQsurVZa7yIzY96uPQQ==
X-Received: by 2002:aca:d608:: with SMTP id n8mr3777487oig.88.1641413140602;
 Wed, 05 Jan 2022 12:05:40 -0800 (PST)
Received: from redhat.com ([38.15.36.239])
 by smtp.gmail.com with ESMTPSA id ay40sm10487001oib.1.2022.01.05.12.05.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 12:05:40 -0800 (PST)
Date: Wed, 5 Jan 2022 13:05:39 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: alex.williamson@redhat.com, qemu-devel@nongnu.org
Subject: Re: [PATCH] vfio/pci: Generate more relevant log messages for reset
 failures
Message-ID: <20220105130539.654f52d5.alex.williamson@redhat.com>
In-Reply-To: <164141253308.4193016.17283187574468953902.stgit@omen>
References: <164141253308.4193016.17283187574468953902.stgit@omen>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Sorry for the dupe and fat-fingering MST's email, please reply to the
other thread at 164141259622.4193261.8252690438434562107.stgit@omen.
Thanks,

Alex


