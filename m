Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72BE05520ED
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 17:29:32 +0200 (CEST)
Received: from localhost ([::1]:36314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3JLH-0005ep-8r
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 11:29:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1o3JJZ-0003TP-NA
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 11:27:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46089)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1o3JJW-0002VO-9U
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 11:27:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655738860;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cejkc/SQC+rpShKtgNDVbUGOS2P3YzW6g2w0ggDqZ4o=;
 b=Ga6qe6SQpPk4wRAknl0SEcog0DZV+bUXKgYSoy3XPSlFEVSYOM6E/n/SNION5r38Z3cyyr
 CmXPpnS0MlagS+HFJoRxfC+cTopkHcM17+PDkKPwCAhJINR0Vm4EtIWbkFIjx0VzysZcY6
 cz1VqIhjLLuHlkTfqgIcEQ3GroSoynQ=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-675-BfsLQu67OzuzaOchhPOdDw-1; Mon, 20 Jun 2022 11:27:39 -0400
X-MC-Unique: BfsLQu67OzuzaOchhPOdDw-1
Received: by mail-il1-f198.google.com with SMTP id
 s15-20020a056e02216f00b002d3d5e41565so7606836ilv.10
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 08:27:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=cejkc/SQC+rpShKtgNDVbUGOS2P3YzW6g2w0ggDqZ4o=;
 b=OwxgdI1Bg/flpVqyz+Rv5CQ8p/VLWvXrRtSaVIuVbFljzlwQFxFLxscdg0M0IxjduN
 t9tS1AP3m0qJXXj+gooayhSgLfm8nPqqHIaDS0eCJUQ5Vk6tEO5W1W0uuJsMkZkuoOOL
 aqo1THrArld6EATWQK4/tC/0lIGdrkHGAFTf3SK12rY/OwYnWZeOUo5zH0Rf6uaX8AFJ
 4ZC7fpTaCkzz+OT4PWAXHdVMBRq7gMqcCT5k50ahkmVs2SvcRyw26KOWOxqMVHeYIuAm
 ZhveMDSmHSewpWCJAlxLpxCCDNbKGdG5HkP41x0gMriHpi3ymQS01uaFjr3wbeQHFl40
 7B/A==
X-Gm-Message-State: AJIora873AxI6IHruqlT/BLsGZ2uZ6D3PMNGhNlZsJoE1xarL4DhMOn5
 CTmoLBX+FzlK7oGdCHPamOMcvLBNFQsvomweUXQkPV3jSvHZt6B2CGqTgMlCFp0WcUqW49D6b1C
 IqGBzrN9UZa+TcDw=
X-Received: by 2002:a05:6e02:158a:b0:2d5:12f0:4dce with SMTP id
 m10-20020a056e02158a00b002d512f04dcemr13535182ilu.159.1655738859124; 
 Mon, 20 Jun 2022 08:27:39 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t9RvYVdhMYu4av7YG3dGUBcIBtajepY7qPo59tqytffpJZcSsEr1ajYk0HbA4PZdb+l1esSA==
X-Received: by 2002:a05:6e02:158a:b0:2d5:12f0:4dce with SMTP id
 m10-20020a056e02158a00b002d512f04dcemr13535175ilu.159.1655738858958; 
 Mon, 20 Jun 2022 08:27:38 -0700 (PDT)
Received: from xz-m1.local
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 f25-20020a02a119000000b0033219dbe34bsm6083048jag.82.2022.06.20.08.27.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 08:27:38 -0700 (PDT)
Date: Mon, 20 Jun 2022 11:27:36 -0400
From: Peter Xu <peterx@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Cc: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?utf-8?B?5b6Q6Zev?= <xuchuangxclwt@bytedance.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v4 1/4] QIOChannelSocket: Introduce assert and reduce
 ifdefs to improve readability
Message-ID: <YrCR6HGSafnrkoiI@xz-m1.local>
References: <20220620053944.257547-1-leobras@redhat.com>
 <20220620053944.257547-2-leobras@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220620053944.257547-2-leobras@redhat.com>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 20, 2022 at 02:39:42AM -0300, Leonardo Bras wrote:
> During implementation of MSG_ZEROCOPY feature, a lot of #ifdefs were
> introduced, particularly at qio_channel_socket_writev().
> 
> Rewrite some of those changes so it's easier to read.
> 
> Also, introduce an assert to help detect incorrect zero-copy usage is when
> it's disabled on build.
> 
> Signed-off-by: Leonardo Bras <leobras@redhat.com>
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


