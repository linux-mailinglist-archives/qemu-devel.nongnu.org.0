Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD756142CC
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 02:40:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opgEm-0003Dk-Hm; Mon, 31 Oct 2022 21:38:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1opgEk-0003DU-Jv
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 21:38:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1opgEj-00044h-1f
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 21:38:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667266720;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Q7zIFdJNOyTd/4ukh68hp01JvyoAkVLEE4zhbqs4pHA=;
 b=ERHtUY4Pbz5Idn0CpO1HWNbH0hd91wQEjpgTs8ZL3uIqi4JJH9ncWsxD+8BoY0HcaEL3Pa
 +jBMwBzTdzJMMEqrnU9i9oHejRTDgUzD0nVeQmSSwER7nnfYy+1Wh/BNRESZuYrn7tzQs2
 ohTwkIIiSZrCEXKqReeRNd6L30wU3RY=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-536-u1L4bUR9Na2HQ7_uOvoaeA-1; Mon, 31 Oct 2022 21:38:38 -0400
X-MC-Unique: u1L4bUR9Na2HQ7_uOvoaeA-1
Received: by mail-ot1-f71.google.com with SMTP id
 r17-20020a056830135100b0066c3ca9c6d8so4238166otq.15
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 18:38:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Q7zIFdJNOyTd/4ukh68hp01JvyoAkVLEE4zhbqs4pHA=;
 b=OZKci7xwBS1S/ATvNJsgXVwANCiAM8j7Vn+zZAv8FOoclGuPPqznqJ7PgNWBtF9Q0s
 NGG0EbI0rvn1OYYXxjwAeRoi1z97ORUnDmDcskhr/zfIVxPRjhoPlz1OtkL7bm5NgPFi
 uJdqFsMUFEUp7lGZRdWfE/Xqk6oryBxqOqgnFCBGXIqmBSSUxx0u7VYFRl1FVGq48n7N
 ywEzdWxGf2b+Cs+QO6UqQ5IWEo6Nfed0h98yIVdB0Hc/EUDVGxasWf8awADLTMeinNoS
 C27uH2d9MW7iOopkztafLDVZOtbHaEPy2lV+yDhgzF0mgemDptztX4Ru8lJTlzMABJN9
 inrg==
X-Gm-Message-State: ACrzQf206h1Uc20krLqn3fQPtlvp9nAeX1JtYpCH6pGOnYXyq0y0gp0U
 aWc8BizsC7QVaghVlZxu10b8z923RFVAKnmM1AENgOhKI5H35U2tS2O9BpUawDKpG6dgvzi8EpA
 miOQVXfmNBoYUtP5GpEAWFwfBYAnH1dE=
X-Received: by 2002:a05:6871:54e:b0:13b:29b7:e2e8 with SMTP id
 t14-20020a056871054e00b0013b29b7e2e8mr18552740oal.35.1667266717594; 
 Mon, 31 Oct 2022 18:38:37 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4kaWyOq7L7INPvdZMpOq+fSjKLwgD2Pzh3mLpVkkAA9UKzBjfdBo/6Qx4Gcp+wzWj8TwYOSg/tRxp9osDgS3Y=
X-Received: by 2002:a05:6871:54e:b0:13b:29b7:e2e8 with SMTP id
 t14-20020a056871054e00b0013b29b7e2e8mr18552730oal.35.1667266717349; Mon, 31
 Oct 2022 18:38:37 -0700 (PDT)
MIME-Version: 1.0
References: <1664913563-3351-1-git-send-email-si-wei.liu@oracle.com>
 <CAJaqyWdtDH8FYzvPLqW8PHmwtUP-puHH=n7EB7xgHsy_uur4Dw@mail.gmail.com>
 <d599973d-a974-b14a-d63c-caff2eba3fe6@oracle.com>
In-Reply-To: <d599973d-a974-b14a-d63c-caff2eba3fe6@oracle.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 1 Nov 2022 09:38:25 +0800
Message-ID: <CACGkMEun2DttZP_3FEDjThU7ShdzRHrB1wdTGtrtSR4MTNcq0g@mail.gmail.com>
Subject: Re: [PATCH] vhost-vdpa: fix assert
 !virtio_net_get_subqueue(nc)->async_tx.elem in virtio_net_reset
To: Si-Wei Liu <si-wei.liu@oracle.com>
Cc: qemu-devel@nongnu.org, Eugenio Perez Martin <eperezma@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

On Sat, Oct 29, 2022 at 1:28 AM Si-Wei Liu <si-wei.liu@oracle.com> wrote:
>
> Hi Jason,
>
> This one is a one-line simple bug fix but seems to be missed from the pull request. If there's a v2 for the PULL, would appreciate if you can piggyback. Thanks in advance!
>
> Regards,
> -Siwei
>

I've queued this for rc1.

Thanks


