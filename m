Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7694397593
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 16:37:43 +0200 (CEST)
Received: from localhost ([::1]:36714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo5WY-0007Bq-Te
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 10:37:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lo5VN-0006Wb-Bx
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 10:36:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lo5VF-0002pu-DD
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 10:36:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622558179;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IhUBI2bPzJcFK7qjXz+qE/PIrvnkqlx0YE4L8DHjFkI=;
 b=eWya1RQRzu30NJOPSQF14ZA8e97UdZXQPxsDHnZNUsm5f8f3XPuIIs7UC3WNmoAUYqYbF6
 CDLRy77w4ozxtZNZv+azpHYuCSQz1PeTd3a1I7Fc8kJUCozO9HjE9g5iaG1dN8gpm21U7D
 PvGLfeCqq+NSgseUSvD78Ru3cO/JLqM=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-292-wwFCHJ7IO-GQQK7UlNnQDA-1; Tue, 01 Jun 2021 10:36:18 -0400
X-MC-Unique: wwFCHJ7IO-GQQK7UlNnQDA-1
Received: by mail-qv1-f69.google.com with SMTP id
 v7-20020a0ccd870000b0290219d3e21c4eso3121431qvm.2
 for <qemu-devel@nongnu.org>; Tue, 01 Jun 2021 07:36:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=IhUBI2bPzJcFK7qjXz+qE/PIrvnkqlx0YE4L8DHjFkI=;
 b=dVCEBy2XCYZUVtHp3XxjiUHWUAICvDEG9NQ/XafXD7AFN+liT1eG90yAngDZw/3HeS
 nDBW3X/CKWMEvg8NG967snmqNOyrw4lKATvtmp0rGDaXzYSgcrlTLx1CL870+f4hsgHr
 tdBsWFZ8npzCOZHvmqK9tZrS9bdekbbNTaBnn6OSoVoTsMZLfa7hQ5wKJCOQ7b/GegcY
 KbtUMx766gpG+7A0uczg945YtLRUQ7BomccsrCvlFwbmILwrP3CrKmqWQKHEYLHbZ7La
 jRry4MtmqzmWuRjybGcLF5DOcqQA14U5OsDdm365akY62/oK3Q1rq1zfN3dc30r8O1M9
 Ej/Q==
X-Gm-Message-State: AOAM532jtugsWGrp+lweBbsSAwp3u6NQSbi7iVSFNh2K0KY7y3J//alu
 H+wWqmjOnvYlO26Wwmb8pabghBdpoeNDC3w4tVaeOw6/OoPW53HAm5Y2gRZ5A15EW1Dz87urtDU
 CJm/6yEb0A57cKew=
X-Received: by 2002:a05:622a:195:: with SMTP id
 s21mr19322157qtw.40.1622558177200; 
 Tue, 01 Jun 2021 07:36:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJywoItUX9cQAmc+1nbznZopC5YnXdV84+W1BvogCyUARKP0M+9cDg/9wwmJnk9u9fxYViBxZA==
X-Received: by 2002:a05:622a:195:: with SMTP id
 s21mr19322134qtw.40.1622558176944; 
 Tue, 01 Jun 2021 07:36:16 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-61-184-147-118-108.dsl.bell.ca. [184.147.118.108])
 by smtp.gmail.com with ESMTPSA id e14sm11096364qkl.1.2021.06.01.07.36.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 07:36:15 -0700 (PDT)
Date: Tue, 1 Jun 2021 10:36:14 -0400
From: Peter Xu <peterx@redhat.com>
To: Hyman <huangy81@chinatelecom.cn>
Subject: Re: [PATCH] hmp: Add "calc_dirty_rate" and "info dirty_rate" cmds
Message-ID: <YLZF3v+RrK1D44X7@t490s>
References: <20210601005708.189888-1-peterx@redhat.com>
 <024ee4df-07a5-a31d-7b97-31d36dfa3ce6@chinatelecom.cn>
MIME-Version: 1.0
In-Reply-To: <024ee4df-07a5-a31d-7b97-31d36dfa3ce6@chinatelecom.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Chuan Zheng <zhengchuan@huawei.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 01, 2021 at 10:08:31PM +0800, Hyman wrote:
> 
> 
> 在 2021/6/1 8:57, Peter Xu 写道:
> > These two commands are missing when adding the QMP sister commands.  Add them,
> > so developers can play with them easier.
> > 
> > Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > Cc: Juan Quintela <quintela@redhat.com>
> > Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>
> > Cc: Chuan Zheng <zhengchuan@huawei.com>
> > Cc: huangy81@chinatelecom.cn
> > Signed-off-by: Peter Xu <peterx@redhat.com>
> > ---
> > PS: I really doubt whether this is working as expected... I ran one 200MB/s
> > workload inside, what I measured is 20MB/s with current algorithm...  Sampling
> > 512 pages out of 1G mem is not wise enough I guess, especially that assumes
> > dirty workload is spread across the memories while it's normally not the case..
> I doubt whether the sampling can cope with the situation that the guest
> dirty memory too fast so that the sampling within a given time can not
> finish, this may happens when vm is in large scale.

Not my case, though..  I'm with a 1G super small VM, starting a malloc()
workload with 200MB, dirty rate 200MB/s.  As I said in the other thread, I
think it's the algorithm that may not really work well with such workload,
while it could be one of the major workloads..

-- 
Peter Xu


