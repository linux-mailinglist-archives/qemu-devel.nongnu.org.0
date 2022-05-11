Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0585F5235A4
	for <lists+qemu-devel@lfdr.de>; Wed, 11 May 2022 16:35:25 +0200 (CEST)
Received: from localhost ([::1]:47724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nonQx-0002oH-Ri
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 10:35:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1nonOz-0001QY-8B
 for qemu-devel@nongnu.org; Wed, 11 May 2022 10:33:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1nonOw-0007fF-H4
 for qemu-devel@nongnu.org; Wed, 11 May 2022 10:33:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652279596;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GtnQMDRcyTklF2W07VQwidY1sqmXa3V4kpU7uzImhEQ=;
 b=T59QpNS8qOZhh5BcbzgRtGkCsxeWh5KTRnlVi7dgorCS8TioeLGiPOxaG1Oy5mRg7I8wJQ
 IC2OzPCIOeHPWfllCEFWPZI8gKCd7EPO+aZH7Ccef3s3fcD7VszeXazl1QTNs+sMZdgXch
 sFe0gMXPwS3VBfXFp/ET9dI2KNvzxLs=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-435-5GXnZFKeMLGOpeMY514oTg-1; Wed, 11 May 2022 10:33:15 -0400
X-MC-Unique: 5GXnZFKeMLGOpeMY514oTg-1
Received: by mail-qv1-f69.google.com with SMTP id
 j2-20020a0cfd42000000b0045ad9cba5deso2149165qvs.5
 for <qemu-devel@nongnu.org>; Wed, 11 May 2022 07:33:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GtnQMDRcyTklF2W07VQwidY1sqmXa3V4kpU7uzImhEQ=;
 b=uVZbIcU709R7WHUvU/p7F7Iuk3r0NZidxt0x2DPbfGjLWU6ITqTcpG2QLag1p3990m
 FQTkTfNU0cj5Yw4cjt9rR3SVPdmY0fUKsyNzYx1xj4SpQk8c/sFoa5fZvpo5WHQTjQyW
 6La2CjFE3sB4KFLT8cxmsAbm1Z4C9UKnVZcafe+f3wsLgWmvhNs8P1Kmta1z3xY9R+JA
 xRsKljpz8rxJlWlBF6lUXRZrnZ0zY/uot1lub+O/rykpz+sAzMzSjY2abnbsu1nmgKoH
 z+kTpPgg4ptvHBGmUVrFdCFU/DW0NI5wbOcWv4+4k+cFtSLRBslBH8yGXve2+T+yGeuO
 T+iw==
X-Gm-Message-State: AOAM5339EAAiUZAu+z9PsKRwsAuRhGWBGESY9eNp0qJ6b1JjNX9TxdKk
 KzDz84S3UIYyz+UnuGZbMrp1ydkd0JjIiB2LS9Js8TbEsLejBZeUWfISmrItfFwINFUThqfcShv
 KQvkIuhtI/sSUqWI=
X-Received: by 2002:ac8:7dc5:0:b0:2f3:f4d4:50e1 with SMTP id
 c5-20020ac87dc5000000b002f3f4d450e1mr927654qte.561.1652279594802; 
 Wed, 11 May 2022 07:33:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwo5Meldgd1SyMNKZWkpw39kzeG4l19bId/1/RPxAmcV7Vyy3tdnG90X9glZJY9wp13b1Vl1w==
X-Received: by 2002:ac8:7dc5:0:b0:2f3:f4d4:50e1 with SMTP id
 c5-20020ac87dc5000000b002f3f4d450e1mr927621qte.561.1652279594416; 
 Wed, 11 May 2022 07:33:14 -0700 (PDT)
Received: from [192.168.100.42] ([82.142.21.186])
 by smtp.gmail.com with ESMTPSA id
 j2-20020ac86642000000b002f39b99f690sm1190681qtp.42.2022.05.11.07.33.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 May 2022 07:33:14 -0700 (PDT)
Message-ID: <826ab23b-a69e-0db4-1080-8a5a83f42dcf@redhat.com>
Date: Wed, 11 May 2022 16:33:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [RFC PATCH 2/6] qapi: net: add socket-ng netdev
Content-Language: en-US
To: Stefano Brivio <sbrivio@redhat.com>
Cc: qemu-devel@nongnu.org, Ralph Schmieder <ralph.schmieder@gmail.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20220509173618.467207-1-lvivier@redhat.com>
 <20220509173618.467207-3-lvivier@redhat.com>
 <20220510232443.641b13b8@elisabeth>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <20220510232443.641b13b8@elisabeth>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/05/2022 23:24, Stefano Brivio wrote:
...
> I don't know if this is an issue, but I couldn't figure out the reason
> for this difference either:
> 
> - with the old socket option, I can pass something like:
> 
>      -net socket,fd=5 -net nic,model=virtio
> 
>    and frames are sent to/received from socket number 5 (which I
>    pre-opened)
> 
> - with the new option, and something like:
> 
>      -netdev socket-ng,id=socket0,mode=client,addr.type=unix,addr.path=/tmp/test.socket -net nic,model=virtio,id=hostnet0
> 
>    I get a connection on the socket, but the virtio-net device is not
>    connected to it (no frames received/sent).
> 
>    However, if instead of "-net nic" I pass this:
> 
>      -device virtio-net-pci,netdev=socket0
> 
>    everything works.
> 

I think the problem is with the hub.

When it works:

     -net socket,udp=localhost:1235,localaddr=localhost:1234 \
     -net nic,model=virtio,macaddr=9a:2b:2c:2d:2e:2f

     (qemu) info network
     hub 0
      \ hub0port1: virtio-net-pci.0: 
index=0,type=nic,model=virtio-net-pci,macaddr=9a:2b:2c:2d:2e:2f
      \ hub0port0: #net039: index=0,type=socket,socket: udp=127.0.0.1:1235

When it doesn't work (with the upcoming new syntax...):

     -net dgram,id=socket0,local.type=inet,local.host=localhost,local.port=1234,\
                           remote.type=inet,remote.host=localhost,remote.port=1235
     -net nic,model=virtio,macaddr=9a:2b:2c:2d:2e:2f

     (qemu) info network
     hub 0
      \ hub0port0: virtio-net-pci.0: 
index=0,type=nic,model=virtio-net-pci,macaddr=9a:2b:2c:2d:2e:2f
     socket0: index=0,type=dgram,udp=127.0.0.1:1234/127.0.0.1:1235

We can see socket0 is not linked to the hub (hub0port0)

With "-device" it works because it doesn't use the hub but the netdev id:

     -device virtio-net,mac=9a:2b:2c:2d:2e:2f,netdev=socket0

     virtio-net-pci.0: index=0,type=nic,model=virtio-net-pci,macaddr=9a:2b:2c:2d:2e:f
      \ socket0: index=0,type=dgram,udp=127.0.0.1:1234/127.0.0.1:1235


I'm investigating...

Thanks,
Laurent


