Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6EF74225B8
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 13:50:55 +0200 (CEST)
Received: from localhost ([::1]:34132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXiyE-00032p-Ok
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 07:50:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mXipz-0005zI-LH
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 07:42:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mXipy-0003aX-56
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 07:42:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633434140;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YlunjfCBH1HV6et4qiimZUSszHGaer0O5miwyMuZpjY=;
 b=GsxXy89PE3/iXBLDVpL89zuPHyLByXrGazqAWMR5Ca60BkFJO3oaPX6kv/Arnqh40OoxQR
 aLiu6p087MNIwsjCpv9VcioV7MDCiUpwlk1zc3H4z8G7dVxTq4+zAWM1oSQ/FW5gKHBYG8
 r5fsKTcLiZNrKYjSMeK6xEZUA7Z3afI=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-339-h_I4cYZPPjWHjn-vU-uuug-1; Tue, 05 Oct 2021 07:42:19 -0400
X-MC-Unique: h_I4cYZPPjWHjn-vU-uuug-1
Received: by mail-ed1-f70.google.com with SMTP id
 b7-20020a50e787000000b003d59cb1a923so20330697edn.5
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 04:42:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=YlunjfCBH1HV6et4qiimZUSszHGaer0O5miwyMuZpjY=;
 b=nyzdMkA+E/IoWjT0LtBPxIun9lXBlvcu9qYV/qV7I/gGoZ+XjxdgrTjSkBYcW4G9o6
 1yzsl0/7B05itRkkmDcwGLm6Jf3dIlZhFe7pdDGtuBD1cg4Vw+vV7MEhaPBR3+J3ZZFg
 psYWPKSnyP+Iu0Qb/ooUXvVw7rmRe1kenZyzAn56xMaodgMyfgcII9fO3Meiuf9sQiBu
 NyjMOEniC1aj+7eNrZoU7SgiknH4jkKXLtOxyqp12u/JsexpYGMdc1MJgxvDq/h5XIs5
 8XWGOCCvZfI6g0l50BkJNuU57TeY1J954hoa0FdkGrCvr2eoG/9KldF9EmVeQTqeSP+W
 DAKQ==
X-Gm-Message-State: AOAM530Rr+vsLq3gjV2He3zqGRlKilg78H+EhTS0VUvKqafLi6ZY67d2
 cwxBmgE5dEDHOjaAg8idwc9f9LJq1Ot283qRSejC+sLEmMEQcD19zsnvWAOVo+j77LtzEUZ05vL
 ey3Hy/5ZUXNxkckU=
X-Received: by 2002:a17:906:a08a:: with SMTP id
 q10mr23321159ejy.100.1633434138138; 
 Tue, 05 Oct 2021 04:42:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxtPHwwvMkn7XkDD/hcXFxXEztIego4xnKGdlUajUT9v9mp9I1Hdqrev5i2+kHWLX7cGRDxxg==
X-Received: by 2002:a17:906:a08a:: with SMTP id
 q10mr23321135ejy.100.1633434137983; 
 Tue, 05 Oct 2021 04:42:17 -0700 (PDT)
Received: from steredhat (host-79-34-250-211.business.telecomitalia.it.
 [79.34.250.211])
 by smtp.gmail.com with ESMTPSA id bx11sm7910624ejb.107.2021.10.05.04.42.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 04:42:17 -0700 (PDT)
Date: Tue, 5 Oct 2021 13:42:15 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v3 2/3] hw/virtio: Acquire RCU read lock in
 virtqueue_packed_drop_all()
Message-ID: <20211005114215.4wmjxpcvtdhdh3fe@steredhat>
References: <20210906104318.1569967-1-philmd@redhat.com>
 <20210906104318.1569967-3-philmd@redhat.com>
 <YVrIBqT2gXAwhNF3@stefanha-x1.localdomain>
 <b761eef0-83b3-ce88-493a-3611f3a7c870@redhat.com>
MIME-Version: 1.0
In-Reply-To: <b761eef0-83b3-ce88-493a-3611f3a7c870@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 04, 2021 at 11:27:12AM +0200, Philippe Mathieu-Daudé wrote:
>On 10/4/21 11:23, Stefan Hajnoczi wrote:
>> On Mon, Sep 06, 2021 at 12:43:17PM +0200, Philippe Mathieu-Daudé wrote:
>>> vring_get_region_caches() must be called with the RCU read lock
>>> acquired. virtqueue_packed_drop_all() does not, and uses the
>>> 'caches' pointer. Fix that by using the RCU_READ_LOCK_GUARD()
>>> macro.
>>
>> Is this a bug that has been encountered, is it a latent bug, a code
>> cleanup, etc? The impact of this isn't clear but it sounds a little
>> scary so I wanted to check.
>
>I'll defer to Stefano, but IIUC it is a latent bug discovered
>during code audit.

Yep, I confirm this. We discovered it by discussing the documentation in 
a previous series.

Thanks,
Stefano


