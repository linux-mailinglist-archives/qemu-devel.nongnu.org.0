Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14AA46C61B4
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 09:31:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfGLq-0004SN-Ri; Thu, 23 Mar 2023 04:31:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1pfGLn-0004Rx-0q
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 04:31:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1pfGLl-0005UI-1M
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 04:31:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679560268;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iYru8Yg2XHN+NfZDd+5pmpZMYN1IPCqzRA0wOsO3gqg=;
 b=AyOvQRhcjDn39EjUWz6h8FJkDBynUq/AdMJfthI70E7PTqtWRxcgYTe0ChGTSv/Y2gfaJR
 AYpwf7JXTC/fD1T3hSRoiVnVYlGtper05vYIYOAuBA4lFgiLyBnVjw4CND1+S77apBdQM/
 FWnzlmsRQk6hvanzMFFkGT/kQgMSJfE=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-605-IZ-GfU3IPMqfLWv5yBGWag-1; Thu, 23 Mar 2023 04:31:06 -0400
X-MC-Unique: IZ-GfU3IPMqfLWv5yBGWag-1
Received: by mail-ed1-f71.google.com with SMTP id
 y24-20020aa7ccd8000000b004be3955a42eso31592178edt.22
 for <qemu-devel@nongnu.org>; Thu, 23 Mar 2023 01:31:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679560266;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iYru8Yg2XHN+NfZDd+5pmpZMYN1IPCqzRA0wOsO3gqg=;
 b=KN0CI6t/b+4Qh9hPuWAY1KJjCvA2oXOV+KDREJRkycdlz0J2jMxGel8jWkmHj76Idv
 wfM/Xa479uzGEw14aKWhIDcYGGUY70AplAa99cp1RY1fPY5WthfXX+bDlJuLArtnpdUJ
 0irXp4QkF50ZpisVS75sflRJqWY5eNoqtSkDJ3O6CuSdMHkqbX4BCZDaVSIkT7c8t5Fy
 Ynn9JjDtXkolRMxYgoewXXYYG/24A17cnTd0mSBap0BHRDL07hKsjCa1jmCUF3Nr7ZPY
 EGMoPhYe04fkL7bkxZjw75HBPhulH80TYU+nbqcXh8I/94g8Q6W2jekQLuI4Dt6jmFGZ
 RAVQ==
X-Gm-Message-State: AO0yUKUGa0gfiTFlDHjc0m30sDfWKn4LXheXQ5l3mP0fnJQVKJzl9tNH
 Af38BNub1UA20L2Go+pCWzLAaHtxmNsXAB86C3+dL0ILhpX9p3wByGW7bFDmWS13RLN2nnXH1QD
 AYy81lx4DVeWGK74=
X-Received: by 2002:a17:906:86d2:b0:933:444a:bbee with SMTP id
 j18-20020a17090686d200b00933444abbeemr10558127ejy.50.1679560265935; 
 Thu, 23 Mar 2023 01:31:05 -0700 (PDT)
X-Google-Smtp-Source: AK7set8XLQy4HE5g2Fc6VIy4iRs7aNulMs7jYhU7D+YaP7QkiNX51vpszXJcJv1VtNYPMh3nxC2i6w==
X-Received: by 2002:a17:906:86d2:b0:933:444a:bbee with SMTP id
 j18-20020a17090686d200b00933444abbeemr10558093ejy.50.1679560265628; 
 Thu, 23 Mar 2023 01:31:05 -0700 (PDT)
Received: from sgarzare-redhat (host-82-53-134-98.retail.telecomitalia.it.
 [82.53.134.98]) by smtp.gmail.com with ESMTPSA id
 ha8-20020a170906a88800b0093a6c591743sm2927751ejb.69.2023.03.23.01.31.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Mar 2023 01:31:05 -0700 (PDT)
Date: Thu, 23 Mar 2023 09:30:59 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: qemu-devel@nongnu.org, alvaro.karsz@solid-run.com,
 Laurent Vivier <lvivier@redhat.com>,
 Gautam Dawar <gdawar@xilinx.com>, Jason Wang <jasowang@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eli Cohen <eli@mellanox.com>,
 si-wei.liu@oracle.com, longpeng2@huawei.com,
 Cindy Lu <lulu@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Shannon Nelson <snelson@pensando.io>, Lei Yang <leiyang@redhat.com>
Subject: Re: [RFC PATCH for 8.1 4/6] vdpa: return errno in
 vhost_vdpa_get_vring_group error
Message-ID: <20230323083059.cgjxjwvpoeq7ucqa@sgarzare-redhat>
References: <20230317145542.347368-1-eperezma@redhat.com>
 <20230317145542.347368-5-eperezma@redhat.com>
 <20230322142634.imcnk7k6q5btze7v@sgarzare-redhat>
 <CAJaqyWeE4_RgPp8bi0fN444BNzvAvxpCAYX2_OTKseD7iGp47g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJaqyWeE4_RgPp8bi0fN444BNzvAvxpCAYX2_OTKseD7iGp47g@mail.gmail.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Mar 22, 2023 at 06:38:21PM +0100, Eugenio Perez Martin wrote:
>On Wed, Mar 22, 2023 at 3:26 PM Stefano Garzarella <sgarzare@redhat.com> wrote:
>>
>> On Fri, Mar 17, 2023 at 03:55:40PM +0100, Eugenio Pérez wrote:
>> >We need to tell in the caller, as some errors are expected in a normal
>> >workflow.  In particular, parent drivers in recent kernels with
>> >VHOST_BACKEND_F_IOTLB_ASID may not support vring groups.  In that case,
>> >-ENOTSUP is returned.
>>
>> So, should we also avoid the error_report if we expect a failure?
>>
>
>It's actually replaced by error_setg in next patches, but I think it
>is worth commenting on the patch message for sure.

Okay, I see now :-)

Thanks,
Stefano

>
>Thanks!
>


