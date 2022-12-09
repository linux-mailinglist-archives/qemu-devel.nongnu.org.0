Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A79A96485AB
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 16:36:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3fPV-0000C9-JN; Fri, 09 Dec 2022 10:35:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <movement@movementarian.org>)
 id 1p3fOo-00007J-Fz
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 10:35:08 -0500
Received: from ssh.movementarian.org ([139.162.205.133] helo=movementarian.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <movement@movementarian.org>)
 id 1p3fOm-0002mo-SA
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 10:34:53 -0500
Received: from movement by movementarian.org with local (Exim 4.95)
 (envelope-from <movement@movementarian.org>) id 1p3fOl-007MPp-9g;
 Fri, 09 Dec 2022 15:34:51 +0000
Date: Fri, 9 Dec 2022 15:34:51 +0000
From: John Levon <levon@movementarian.org>
To: John Johnson <john.g.johnson@oracle.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v1 08/24] vfio-user: define socket receive functions
Message-ID: <Y5NVm9JxpbVZEMKE@movementarian.org>
References: <cover.1667542066.git.john.g.johnson@oracle.com>
 <297c4b40b5f99c26ad78c7d2a729db436951b5f9.1667542066.git.john.g.johnson@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <297c4b40b5f99c26ad78c7d2a729db436951b5f9.1667542066.git.john.g.johnson@oracle.com>
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

On Tue, Nov 08, 2022 at 03:13:30PM -0800, John Johnson wrote:

> Add infrastructure needed to receive incoming messages
> 
> +static void vfio_user_process(VFIOProxy *proxy, VFIOUserMsg *msg, bool isreply)
> +{
> +
> +    /*
> +     * Replies signal a waiter, if none just check for errors
> +     * and free the message buffer.
> +     *
> +     * Requests get queued for the BH.
> +     */
> +    if (isreply) {
> +        msg->complete = true;
> +        if (msg->type == VFIO_MSG_WAIT) {
> +            qemu_cond_signal(&msg->cv);
> +        } else {
> +            if (msg->hdr->flags & VFIO_USER_ERROR) {
> +                error_printf("vfio_user_rcv:  error reply on async request ");

nit, s/vfio_user_rcv/vfio_user_process/ , or even __func__ ?

> +    error_prepend(&local_err, "vfio_user_recv: ");

nit, same here

regards
john

