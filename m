Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9DA64883A
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 19:13:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3hqg-0003Om-4s; Fri, 09 Dec 2022 13:11:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <movement@movementarian.org>)
 id 1p3hqe-0003Oa-0X
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 13:11:48 -0500
Received: from ssh.movementarian.org ([139.162.205.133] helo=movementarian.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <movement@movementarian.org>)
 id 1p3hqc-0007aU-E2
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 13:11:47 -0500
Received: from movement by movementarian.org with local (Exim 4.95)
 (envelope-from <movement@movementarian.org>) id 1p3hqa-007P7J-Tu;
 Fri, 09 Dec 2022 18:11:44 +0000
Date: Fri, 9 Dec 2022 18:11:44 +0000
From: John Levon <levon@movementarian.org>
To: John Johnson <john.g.johnson@oracle.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v1 20/24] vfio-user: dma read/write operations
Message-ID: <Y5N6YF+8iRd6Dtg9@movementarian.org>
References: <cover.1667542066.git.john.g.johnson@oracle.com>
 <a8fb12e4fde39698cbd9b970d822906b18b2eccd.1667542066.git.john.g.johnson@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a8fb12e4fde39698cbd9b970d822906b18b2eccd.1667542066.git.john.g.johnson@oracle.com>
X-Url: http://www.movementarian.org/
Received-SPF: pass client-ip=139.162.205.133;
 envelope-from=movement@movementarian.org; helo=movementarian.org
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
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

On Tue, Nov 08, 2022 at 03:13:42PM -0800, John Johnson wrote:

>  static void vfio_user_pci_process_req(void *opaque, VFIOUserMsg *msg)
>  {
> +    VFIOPCIDevice *vdev = opaque;
> +    VFIOUserHdr *hdr = msg->hdr;
> +
> +    /* no incoming PCI requests pass FDs */
> +    if (msg->fds != NULL) {
> +        vfio_user_send_error(vdev->vbasedev.proxy, hdr, EINVAL);
> +        vfio_user_putfds(msg);
> +        return;
> +    }
>  
> +    switch (hdr->command) {
> +    case VFIO_USER_DMA_READ:
> +        vfio_user_dma_read(vdev, (VFIOUserDMARW *)hdr);
> +        break;
> +    case VFIO_USER_DMA_WRITE:
> +        vfio_user_dma_write(vdev, (VFIOUserDMARW *)hdr);
> +        break;
> +    default:
> +        error_printf("vfio_user_process_req unknown cmd %d\n", hdr->command);

__func__ or vfio_user_pci_process_req ?

regards
john

