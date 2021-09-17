Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C2F40F6B0
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 13:26:39 +0200 (CEST)
Received: from localhost ([::1]:60930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRC0s-0004am-FZ
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 07:26:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mRBy8-0002ny-UO
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 07:23:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52148)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mRBy6-0001W1-H9
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 07:23:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631877824;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vmf8Y7OocOxD66xIeDRi66iV8he0SSpaA9yA8vfqhXI=;
 b=X/GmF+DqEhVG3FkeGCgqkGe7kXiLGdELEDAhQTeEPsAYkwBSufmpaWF+qIU/Vf8z0h7gVD
 +DLHbhXthLWEsL5DdsxlDDCPTNy10bPqZca17EbUZzvi0px63XP15ygmQvP4FgpWWI7u2o
 AFudqH4OMnNgSTUCfeUFhWXtS7CzuoE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-317-QqhhX-t7OLKrrG_Rxuqefg-1; Fri, 17 Sep 2021 07:23:43 -0400
X-MC-Unique: QqhhX-t7OLKrrG_Rxuqefg-1
Received: by mail-wr1-f72.google.com with SMTP id
 f7-20020a5d50c7000000b0015e288741a4so3606147wrt.9
 for <qemu-devel@nongnu.org>; Fri, 17 Sep 2021 04:23:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=Vmf8Y7OocOxD66xIeDRi66iV8he0SSpaA9yA8vfqhXI=;
 b=S3/hKJVSEUU3u0EftGRTwndHifnAt9bvLwGZ1jWxI3D7dGClYv7Veqv4BAXbmszDg6
 gzlJ5MgiMz2oMrchfsYWhVTH0w1Q0Gn/9I6iojBJ/She0eS61LHDs4zphSl5VjCTI+k7
 xFCNuDIOgWo/KSFnfMeAEu5jRVnQtkPc4sUuXuBa4835Jrodsl+v8yJJF0+JNTs772hT
 7jzG1K/K377oYbe0yRbnzXRYjIj+HyLYBLQ4aF1jWzKL8IjaK0W8xGE5RWe3OOHXTIny
 ZmVEzw2rvZua7r8SeKitmFg5gKSJt9lJbUr96wM9LvPHG5If8c55U/QJuk4DEQPSZMsr
 BBBA==
X-Gm-Message-State: AOAM532q2AFAJavdIzYJrhBd/yE09Ts09JOzJ/9wEOuXgr+s6ZWqJygo
 RX9ScjENGJaECrzn0vzvMDDXcHEYUEvLvI/F/tcwarDA4kuUvxzH8ii+vgWR52YA78UHAaqOrGj
 YCNG+WnBvV8/m9NA=
X-Received: by 2002:adf:e88d:: with SMTP id d13mr11461185wrm.91.1631877822687; 
 Fri, 17 Sep 2021 04:23:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxe+Qd0B6PFeTbr8/wpHSR5RIP58aaA8xWFOIy9u4p9jJfF1+tGDBQUNBLvb12feKRkql1sYw==
X-Received: by 2002:adf:e88d:: with SMTP id d13mr11461175wrm.91.1631877822551; 
 Fri, 17 Sep 2021 04:23:42 -0700 (PDT)
Received: from dresden.str.redhat.com
 ([2a02:908:1e48:3780:4451:9a65:d4e9:9bb6])
 by smtp.gmail.com with ESMTPSA id x13sm6499248wrg.62.2021.09.17.04.23.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Sep 2021 04:23:42 -0700 (PDT)
Subject: Re: [PATCH v3 16/16] iotests/linters: check mypy files all at once
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20210916040955.628560-1-jsnow@redhat.com>
 <20210916040955.628560-17-jsnow@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <2235c3ee-0987-c6e2-1929-7785c74db286@redhat.com>
Date: Fri, 17 Sep 2021 13:23:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210916040955.628560-17-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.488, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16.09.21 06:09, John Snow wrote:
> We can circumvent the '__main__' redefinition problem by passing
> --scripts-are-modules. Take mypy out of the loop per-filename and check
> everything in one go: it's quite a bit faster.

Is it possible to pull this to the beginning of the series?  Just 
because patch 14 has to make everything quite slow (which might be a 
tiny nuisance in bisecting some day?).

>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   tests/qemu-iotests/linters.py | 62 ++++++++++++++++-------------------
>   1 file changed, 29 insertions(+), 33 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


