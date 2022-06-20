Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1E755208E
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 17:23:43 +0200 (CEST)
Received: from localhost ([::1]:50786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3JFe-0004jY-Hd
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 11:23:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1o3JBJ-0006R3-A0
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 11:19:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1o3JBH-00014p-N9
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 11:19:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655738351;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YcVrrrgpOZkoFIYmg1HKzuX58ncFNBSwYrptSYo0oXE=;
 b=fVKH1+BKTeVbHpgZrxwX+GNdT5YoAB210M/PnsyaScDlJH8NNygtmOT9d1tcHG8crA7exa
 y8gI2QlZ8GwEoRVkNYtS93kHwVR9wH17L5cFqw7cYoOHrta0Do6pBKdGM2duLfRj4k/BYC
 j35zYulbseDk61sviCVirG4UTMrJhd4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-574-JvhACsnvPViu3g5wccIakg-1; Mon, 20 Jun 2022 11:19:09 -0400
X-MC-Unique: JvhACsnvPViu3g5wccIakg-1
Received: by mail-wm1-f72.google.com with SMTP id
 r83-20020a1c4456000000b0039c8f5804c4so7021574wma.3
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 08:19:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YcVrrrgpOZkoFIYmg1HKzuX58ncFNBSwYrptSYo0oXE=;
 b=AIy3ac28CChtyc13o6ARrL4jyxgfNYyvy0eL+OP/jtWdzRFOaTjmYJuxaxvcoSolx0
 wj2r6wjsr2ZJEHZjDrSi3RPTcAWj60JigcEXM5tHox7/QAbah8vU8Lh8XKWJT/oDaFf5
 IeyRYnijnZwsqBCUowoc0f2P44nM/FBUEsHvuzen8KlLe7yt0+xDoiSiTyDLCpviCQWH
 x4XfFUqfeMFmM6n/yWbvcbj20nwoWRQT5FffMo7Iga18Av5yelHKXaHLQb9yDpuhHKPJ
 kGcEbkm/9U2v/OAiNmo/m+p9oRdqleCxH540VVU6FI93jeZQglX5JL7cRnUd+5hnhjnv
 UrLQ==
X-Gm-Message-State: AOAM533Ec9/IDhgpiOhZNeQT0BTsl5O/cRQXA42x3QM9Ai1cLUDCq5xT
 6HYhfIHb+BTd2L7IIzpNNw/PoyMdZ3tyi4Xw//T4cXiSFx2Ai0TDHutC+RBcDbBo9JLgqWUCzdG
 0eXbHNV9CCtxgMMQ=
X-Received: by 2002:a05:600c:23d0:b0:39c:63d4:69a6 with SMTP id
 p16-20020a05600c23d000b0039c63d469a6mr35761681wmb.5.1655738348631; 
 Mon, 20 Jun 2022 08:19:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzBsLmmyWeI9Yuxcz3D9x1JHshObmNJpRVQJbve04+gmm221tIOaju3gh9rxAL4NOQh2DwIjA==
X-Received: by 2002:a05:600c:23d0:b0:39c:63d4:69a6 with SMTP id
 p16-20020a05600c23d000b0039c63d469a6mr35761664wmb.5.1655738348419; 
 Mon, 20 Jun 2022 08:19:08 -0700 (PDT)
Received: from localhost ([212.145.226.77]) by smtp.gmail.com with ESMTPSA id
 p10-20020a5d48ca000000b002102f2fac37sm13873210wrs.51.2022.06.20.08.19.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 08:19:08 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org,  qemu-block@nongnu.org,  "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>,  Stefan Hajnoczi <stefanha@redhat.com>,  Hailiang
 Zhang <zhang.zhanghailiang@huawei.com>,  Fam Zheng <fam@euphon.net>,
 Hailiang Zhang <zhanghailiang@xfusion.com>
Subject: Re: [PATCH v2 10/21] migration: convert savevm to use
 QIOChannelBlock for VMState
In-Reply-To: <20220620110205.1357829-11-berrange@redhat.com> ("Daniel
 P. =?utf-8?Q?Berrang=C3=A9=22's?= message of "Mon, 20 Jun 2022 12:01:54
 +0100")
References: <20220620110205.1357829-1-berrange@redhat.com>
 <20220620110205.1357829-11-berrange@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Mon, 20 Jun 2022 17:19:07 +0200
Message-ID: <878rpr2wic.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
> With this change, all QEMUFile usage is backed by QIOChannel at
> last.
>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


>  {
>      if (is_writable) {
> -        return qemu_fopen_ops(bs, &bdrv_write_ops, false);
> +        return qemu_fopen_channel_output(QIO_CHANNEL(qio_channel_block_n=
ew(bs)));
> +    } else {
> +        return qemu_fopen_channel_input(QIO_CHANNEL(qio_channel_block_ne=
w(bs)));
>      }
> -    return qemu_fopen_ops(bs, &bdrv_read_ops, false);
>  }

I really preffer the original syntax:

    if (is_writable) {
        return qemu_fopen_channel_output(QIO_CHANNEL(qio_channel_block_new(=
bs)));
    }
    return qemu_fopen_channel_input(QIO_CHANNEL(qio_channel_block_new(bs)));

But as you wrote the patch, and it is a big cleanup, I will not
complain.

Later, Juan.


